import 'package:flutter/material.dart';
import 'package:better_player_plus/better_player_plus.dart';

import '../../../model/live_view/live_view_model.dart';
import 'floating_reaction.dart';
import 'live_view_comments.dart';
import 'live_view_header.dart';
import 'live_view_input_bar.dart';

class LiveViewBody extends StatefulWidget {
  final LiveViewModel liveViewModel;

  const LiveViewBody({Key? key, required this.liveViewModel}) : super(key: key);

  @override
  State<LiveViewBody> createState() => _LiveViewBodyState();
}

class _LiveViewBodyState extends State<LiveViewBody> with TickerProviderStateMixin {
  BetterPlayerController? _betterPlayerController;
  final TextEditingController _commentController = TextEditingController();
  final ScrollController _commentScrollController = ScrollController();
  final List<LiveComment> _comments = [];
  final List<Widget> _reactions = [];

  @override
  void initState() {
    super.initState();
    _initializePlayer(widget.liveViewModel.streamUrl);
    _comments.addAll(widget.liveViewModel.comments);
  }

  Future<void> _initializePlayer(String url) async {
    _betterPlayerController?.dispose();
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,
        fit: BoxFit.fill,
        looping: true,
        controlsConfiguration: const BetterPlayerControlsConfiguration(showControls: false),
      ),
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        url,
        liveStream: true,
        videoFormat: BetterPlayerVideoFormat.hls,
      ),
    );
    setState(() {});
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
      _reactions.add(FloatingReaction(key: UniqueKey()));
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
    return Stack(
      children: [
        Positioned.fill(
          child: _betterPlayerController != null
              ? BetterPlayer(controller: _betterPlayerController!)
              : const SizedBox(),
        ),
        ..._reactions,
        LiveViewComments(
          comments: _comments,
          commentScrollController: _commentScrollController,
        ),
        LiveViewInputBar(
          commentController: _commentController,
          onSubmit: _submitComment,
          onHeartTap: _triggerHeart,
        ),
        LiveViewHeader(model: widget.liveViewModel),
      ],
    );
  }
}
