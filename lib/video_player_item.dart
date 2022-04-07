import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoController;
  bool isShowPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoController.play();
        setState(() {
          isShowPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  Widget isPlaying() {
    return _videoController.value.isPlaying && !isShowPlaying
        ? Container()
        : Icon(
            Icons.play_arrow,
            size: 80,
            color: Colors.white.withOpacity(0.5),
          );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        setState(() {
          _videoController.value.isPlaying
              ? _videoController.pause()
              : _videoController.play();
        });
      },
      child: Container(
          height: size.height,
          width: size.width,
          child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Stack(
              children: <Widget>[
                VideoPlayer(_videoController),
                Center(
                  child: Container(
                    child: _videoController.value.isPlaying && !isShowPlaying
                        ? Container()
                        : Icon(
                            Icons.play_arrow,
                            size: 80,
                            color: Colors.white.withOpacity(0.5),
                          ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
