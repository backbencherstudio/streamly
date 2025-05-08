import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:better_player_plus/better_player_plus.dart';

import '../../../block/live_view/live_view_bloc.dart';
import '../../../block/live_view/live_view_event.dart';
import '../../../block/live_view/live_view_state.dart';
import '../../../model/live_view/live_view_model.dart';

class LiveViewScreen extends StatefulWidget {
  const LiveViewScreen({super.key});

  @override
  State<LiveViewScreen> createState() => _LiveViewScreenState();
}

class _LiveViewScreenState extends State<LiveViewScreen>
    with TickerProviderStateMixin {
  BetterPlayerController? _betterPlayerController;
  bool _isInitialized = false;
  String? _urlToPlay;

  final TextEditingController _commentController = TextEditingController();
  final List<LiveComment> _comments = [];
  final List<_FloatingReaction> _reactions = [];
  final ScrollController _commentScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<LiveViewBloc>().add(LoadLiveView());
  }

  Future<void> _initializePlayer(String url) async {
    _betterPlayerController?.dispose();
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,
        fit: BoxFit.fill,
        looping: true,
        controlsConfiguration:
        const BetterPlayerControlsConfiguration(showControls: false),
      ),
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        url,
        liveStream: true,
        videoFormat: BetterPlayerVideoFormat.hls,
      ),
    );

    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _betterPlayerController?.dispose();
    _commentController.dispose();
    _commentScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox.expand(
          child: BlocBuilder<LiveViewBloc, LiveViewState>(
            builder: (context, state) {
              if (state is LiveViewLoaded) {
                if (!_isInitialized ||
                    _urlToPlay != state.liveViewModel.streamUrl) {
                  _urlToPlay = state.liveViewModel.streamUrl;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _initializePlayer(_urlToPlay!);
                    _comments.addAll(state.liveViewModel.comments);
                  });
                }
                return _buildLiveUI(state.liveViewModel);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLiveUI(LiveViewModel model) {
    return Stack(
      children: [
        Positioned.fill(
          child: _betterPlayerController != null
              ? BetterPlayer(controller: _betterPlayerController!)
              : const SizedBox(),
        ),

        ..._reactions,

        // Comments list
        Positioned(
          bottom: 110,
          left: 12,
          right: 80,
          child: SizedBox(
            height: 180,
            child: ListView.builder(
              controller: _commentScrollController,
              padding: EdgeInsets.zero,
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundImage:
                        NetworkImage("https://i.imgur.com/2yaf2wb.jpg"),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${comment.name}: ',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: comment.message,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

        // Join info
        Positioned(
          bottom: 80,
          left: 16,
          child: Text(
            "Melania and 80 others joined this live-stream",
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
        ),

        // Input bar
        Positioned(
          bottom: 20,
          left: 12,
          right: 12,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Add a comment",
                    hintStyle: const TextStyle(color: Colors.white60),
                    filled: true,
                    fillColor: Colors.black45,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onSubmitted: _submitComment,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _triggerHeart,
                child: const Icon(Icons.favorite,
                    color: Colors.red, size: 26),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => _submitComment(_commentController.text),
                child: const Icon(Icons.send, color: Colors.white, size: 26),
              ),
            ],
          ),
        ),

        // Top bar
        Positioned(
          top: 40,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(model.userImage),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      model.userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.remove_red_eye,
                        color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      model.viewers,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  child:
                  const Icon(Icons.close, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _submitComment(String value) {
    if (value.trim().isEmpty) return;
    setState(() {
      _comments.add(LiveComment(name: "You", message: value.trim()));
      _commentController.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_commentScrollController.hasClients) {
        _commentScrollController.animateTo(
          _commentScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _triggerHeart() {
    setState(() {
      _reactions.add(_FloatingReaction(key: UniqueKey()));
    });
  }
}

class _FloatingReaction extends StatefulWidget {
  const _FloatingReaction({Key? key}) : super(key: key);

  @override
  State<_FloatingReaction> createState() => _FloatingReactionState();
}

class _FloatingReactionState extends State<_FloatingReaction>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _moveUp;
  final double _left = 250 + Random().nextDouble() * 50;
  final double _size = 18 + Random().nextDouble() * 10;
  final double _start = 80;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _moveUp = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Positioned(
          bottom: _start + _moveUp.value,
          left: _left,
          child: Opacity(
            opacity: 1.0 - (_moveUp.value / 150),
            child: Icon(Icons.favorite, color: Colors.redAccent, size: _size),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
