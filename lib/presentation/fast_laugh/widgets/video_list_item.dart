// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:netflix_app/applications/fast_laugh/fast_laugh_bloc.dart';

import 'package:netflix_app/core/constant/constant.dart';
import 'package:netflix_app/presentation/fast_laugh/widgets/video_action_items.dart';

import '../../../core/Colors/Colors.dart';
import '../../../domain/downloads/models/downloadsModel.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

//! InheritedClass
class videoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const videoListItemInheritedWidget({
    super.key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);

  @override
  bool updateShouldNotify(covariant videoListItemInheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.movieData != movieData;
  }

  static videoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<videoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //profileImage
    final posterPath =
        videoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyvideosUrl[index % dummyvideosUrl.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //! LEFT SIDE
                CircleAvatar(
                  backgroundColor: kBlackColor.withOpacity(0.3),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: kWhiteColor,
                    ),
                  ),
                ),

                //! RIGHT SIDE
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: CircleAvatar(
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterPath'),
                        radius: 30,
                      ),
                    ),
                    VideoActionWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActionWidget(icon: Icons.add, title: 'My List'),
                    GestureDetector(
                      onTap: () {
                        final movieName = videoListItemInheritedWidget.of(context)?.movieData.title;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child:
                          VideoActionWidget(icon: Icons.share, title: 'Share'),
                    ),
                    VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//!vdoPlayer
class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer({
    Key? key,
    required this.videoUrl,
    required this.onStateChanged,
  }) : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  //Initialize
  @override
  void initState() {
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }
}
