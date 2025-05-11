import 'package:flutter/material.dart';
import 'package:better_player_plus/better_player_plus.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;

  const VideoPlayerWidget({
    Key? key,
    required this.videoUrl,
    required this.videoTitle,
  }) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    _setupPlayer();
  }

  void _setupPlayer() {
    final dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
      bufferingConfiguration: const BetterPlayerBufferingConfiguration(
        minBufferMs: 20000,
        maxBufferMs: 50000,
        bufferForPlaybackMs: 2500,
        bufferForPlaybackAfterRebufferMs: 5000,
      ),
    );

    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,
        aspectRatio: 16 / 9,
        fit: BoxFit.contain,
        autoDetectFullscreenAspectRatio: true,
        controlsConfiguration: const BetterPlayerControlsConfiguration(
          controlBarColor: Colors.black87,
          iconsColor: Colors.white,
          playIcon: Icons.play_arrow,
          pauseIcon: Icons.pause,
          enableSkips: true,
          skipForwardIcon: Icons.forward_10,
          skipBackIcon: Icons.replay_10,
          enablePlaybackSpeed: true,
          enableProgressBarDrag: true,
          enableFullscreen: true,
          enableMute: true,
          progressBarBufferedColor: Colors.white54,
          progressBarPlayedColor: Colors.redAccent,
          progressBarHandleColor: Colors.red,
          loadingColor: Colors.white,
          showControls: true,
          enableRetry: true,
          enableProgressText: true,
          liveTextColor: Colors.red,
        ),
      ),
      betterPlayerDataSource: dataSource,
    );
  }

  @override
  void didUpdateWidget(VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoUrl != oldWidget.videoUrl) {
      _betterPlayerController.setupDataSource(
        BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          widget.videoUrl,
        ),
      );
      _betterPlayerController.play();
    }
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          ClipRRect(
           // borderRadius: BorderRadius.circular(10),
            child: BetterPlayer(controller: _betterPlayerController),
          ),
          Positioned(
            top: 12,
            left: 12,
            right: 12,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    // decoration: BoxDecoration(
                    //   color: Colors.black45,
                    //   shape: BoxShape.circle,
                    // ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(right: 32),
                    child: Text(
                      widget.videoTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
