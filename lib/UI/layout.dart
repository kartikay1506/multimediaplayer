import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

layout() {
  var controller = VideoPlayerController.asset('assets/butterfly.mp4');
  controller.initialize();

  var layoutBody = Container(
    alignment: Alignment.center,
    child: Column(
      children: <Widget>[
        Container(
          width: 400,
          height: 200,
          color: Colors.grey,
          child: Card(
            child: VideoPlayer(controller),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                print("Playing Video");
                controller.play();
              },
              child: Icon(Icons.play_arrow),
            ),
            FloatingActionButton(
              onPressed: () {
                print("Video Paused");
                controller.pause();
              },
              child: Icon(Icons.pause),
            ),
          ],
        ),
        /* FloatingActionButton(
          onPressed: () {
            if (controller.value.isPlaying) {
              test = false;
              controller.pause();
            } else {
              test = true;
              controller.play();
              print(test);
            }
          },
          child: Icon(
            controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ), */
      ],
    ),
  );

  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: layoutBody,
    ),
  );
}
