import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

import '../../../block/live_view/live_view_bloc.dart';
import '../../../block/live_view/live_view_event.dart';
import '../../../block/live_view/live_view_state.dart';

class LiveViewScreen extends StatefulWidget {
  const LiveViewScreen({super.key});

  @override
  State<LiveViewScreen> createState() => _LiveViewScreenState();
}

class _LiveViewScreenState extends State<LiveViewScreen> {
  BetterPlayerController? _betterPlayerController;
  bool _isInitialized = false;
  String? _urlToPlay;
  final Logger _logger = Logger('LiveViewScreen');
  int _retryCount = 0;
  final int _maxRetries = 5;
  bool _isRetrying = false;

  @override
  void initState() {
    super.initState();
    _setupLogging();
    context.read<LiveViewBloc>().add(LoadLiveView());
  }

  void _setupLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  Future<bool> _checkStreamAccessibility(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'User-Agent': 'Mozilla/5.0',
          'Accept': '*/*',
          'Range': 'bytes=0-1',
        },
      );
      return response.statusCode == 200 || response.statusCode == 206;
    } catch (e) {
      _logger.severe('Stream check failed: $e');
      return false;
    }
  }

  Future<void> _initializePlayer(String url) async {
    try {
      if (!await _checkStreamAccessibility(url)) {
        throw Exception('Stream unavailable');
      }

      final headers = {
        'User-Agent': 'Mozilla/5.0',
        'Accept': '*/*',
        'Referer': 'https://livepush.io',
      };

      // Clean up existing controller
      if (_betterPlayerController != null) {
        _betterPlayerController!.dispose();
        _betterPlayerController = null;
      }

      _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          autoPlay: true,
          controlsConfiguration: const BetterPlayerControlsConfiguration(
            showControls: false,
          ),
          errorBuilder: (context, errorMessage) =>
              _buildErrorUI(errorMessage, url),
        ),
        betterPlayerDataSource: BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          url,
          headers: headers,
          liveStream: true,
          videoFormat: BetterPlayerVideoFormat.hls,
          cacheConfiguration: const BetterPlayerCacheConfiguration(
            useCache: true,
            maxCacheSize: 10 * 1024 * 1024,
          ),
        ),
      );

      _betterPlayerController?.addEventsListener((event) {
        if (event.betterPlayerEventType == BetterPlayerEventType.exception) {
          final error =
              event.parameters?['error']?.toString() ?? 'Unknown error';
          _logger.severe('Player error: $error');
          _retryPlayer(url);
        }
      });

      if (!mounted) return;
      setState(() {
        _isInitialized = true;
        _retryCount = 0;
        _isRetrying = false;
      });
    } catch (e) {
      _logger.severe('Player init failed: $e');
      _retryPlayer(url);
    }
  }

  Widget _buildErrorUI(String? errorMessage, String url) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage ?? 'Stream playback failed',
            style: const TextStyle(color: Colors.white),
          ),
          ElevatedButton(
            onPressed: () => _retryPlayer(url),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Future<void> _retryPlayer(String url) async {
    if (_retryCount >= _maxRetries) return;

    if (!mounted) return;
    setState(() {
      _isInitialized = false;
      _isRetrying = true;
    });

    _retryCount++;
    final delay = Duration(seconds: min(30, pow(2, _retryCount).toInt()));

    await Future.delayed(delay);
    if (!mounted) return;
    await _initializePlayer(url);
  }

  @override
  void dispose() {
    _betterPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<LiveViewBloc, LiveViewState>(
        builder: (context, state) {
          if (state is LiveViewLoading) {
            return _buildLoading();
          } else if (state is LiveViewLoaded) {
            return _handleLiveViewLoaded(state);
          } else if (state is LiveViewError) {
            return _buildError(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _handleLiveViewLoaded(LiveViewLoaded state) {
    if (!_isInitialized || _urlToPlay != state.liveViewModel.streamUrl) {
      _urlToPlay = state.liveViewModel.streamUrl;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _urlToPlay != null) {
          _initializePlayer(_urlToPlay!);
        }
      });
    }

    return Stack(
      children: [
        if (_isInitialized && _betterPlayerController != null)
          BetterPlayer(controller: _betterPlayerController!)
        else
          _buildLoadingWithRetry(),
      ],
    );
  }

  Widget _buildLoadingWithRetry() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (_isRetrying) ...[
            const SizedBox(height: 20),
            Text(
              'Retrying... ($_retryCount/$_maxRetries)',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                context.read<LiveViewBloc>().add(LoadLiveView()),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
