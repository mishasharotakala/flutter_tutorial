import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/abc.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class Fun extends StatefulWidget {
  Fun({Key? key, required this.model,}) : super(key: key);

  ABCWidget? model;

  @override 
  State<Fun> createState() => _FunState();
}

class _FunState extends State<Fun> {

  late VideoPlayerController controller;

  @override 
  void initState() {
    controller = VideoPlayerController.network(widget.model!.url.toString());
    controller.initialize().then((_) {setState(() {
      
    });});
    super.initState();
  }

  @override 
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (controller.value.isPlaying) {
            controller.pause();
          } else {
            controller.play();
          }
        });
      },
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(controller),
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.2, 0.8, 1.0],
                  ),
                ),
              ),
            ),
            _buildVideoCaptions(context),
            _buildVideoActions(context),
          ],
        ),
      ),
    );
  }

  Align _buildVideoActions(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: controller.value.size.height,
        width: MediaQuery.of(context).size.width * 0.2,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Material(
                  color: Colors.transparent,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.black,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {}, 
                      color: Colors.white,
                      icon: const Icon(Icons.favorite),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  '11.4k',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Align _buildVideoCaptions(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 125,
        width: MediaQuery.of(context).size.width * 0.75,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to my Video',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              "Days ache and nights are long Two years and still you're not gone Guess I'm still holding on Drag my name through the dirt Somehow, it doesn't hurt though Guess you're still holding on",
              maxLines: 3,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
