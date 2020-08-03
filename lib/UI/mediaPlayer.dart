import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';

playPrevSong() {
  print("Previous Song!");
  Fluttertoast.showToast(
    msg: "Previous Song",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

playNextSong() {
  print("Next Song!");
  Fluttertoast.showToast(
    msg: "Next Song",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

mediaPlayer() {
  var localAudio = AudioCache();
  var networkAudio = AudioPlayer();
  var controller = VideoPlayerController.asset('assets/butterfly.mp4');
  VideoPlayerController networkController = VideoPlayerController.network(
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  );
  controller.initialize();
  networkController.initialize();

  var playerBody = TabBarView(
    children: [
      Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 350,
              height: 380,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                //color: Colors.grey,
                child: GestureDetector(
                  //splashColor: Colors.blue.withOpacity(0.3),
                  onTap: () {
                    print("Toggling Lyrics!");
                    Fluttertoast.showToast(
                      msg: "Lyrics",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  child: Image.asset('images/flutter-image.jpg'),
                ),
                elevation: 10,
              ),
            ),
            Container(
              width: 350,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  RangeSlider(values: RangeValues(0, 0), onChanged: null),
                  Row(
                    children: <Widget>[
                      Text("0:00"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.skip_previous),
                    onPressed: playPrevSong,
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      print("Playing!");
                      localAudio.play('sample.wav');
                    },
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.skip_next),
                    onPressed: playNextSong,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Local Video",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
                Container(
                  padding: EdgeInsets.all(15),
                  child: FloatingActionButton(
                    onPressed: () {
                      print("Playing Video");
                      controller.play();
                    },
                    child: Icon(Icons.play_arrow),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: FloatingActionButton(
                    onPressed: () {
                      print("Video Paused");
                      controller.pause();
                    },
                    child: Icon(Icons.pause),
                  ),
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
      ),
      Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Network Stream Audio",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 350,
              height: 80,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                //color: Colors.grey,
                child: Image.asset('images/flutter-image.jpg'),
                elevation: 10,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FloatingActionButton(
                      onPressed: () {
                        print("Network Audio Playing!");
                        networkAudio.play(
                          'https://file-examples-com.github.io/uploads/2017/11/file_example_WAV_1MG.wav',
                        );
                      },
                      child: Icon(Icons.play_arrow),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FloatingActionButton(
                      onPressed: () {
                        print("Network Audio Paused!");
                        networkAudio.pause();
                      },
                      child: Icon(Icons.pause),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Network Stream Video",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 400,
              height: 200,
              child: Card(
                child: VideoPlayer(networkController),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FloatingActionButton(
                      onPressed: () {
                        print("Network Video Playing!");
                        networkController.play();
                      },
                      child: Icon(Icons.play_arrow),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FloatingActionButton(
                      onPressed: () {
                        print("Network Video Paused!");
                        networkController.pause();
                      },
                      child: Icon(Icons.pause),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );

  return MaterialApp(
    home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print("Back Button Pressed");
              Fluttertoast.showToast(
                msg: "Back Button",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
          ),
          title: Text("Media Player"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print("Settings");
                Fluttertoast.showToast(
                  msg: "Settings",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.library_music),
              ),
              Tab(
                icon: Icon(Icons.video_library),
              ),
              Tab(
                icon: Icon(Icons.cloud_download),
              ),
            ],
          ),
        ),
        body: playerBody,
      ),
    ),
    debugShowCheckedModeBanner: false,
  );
}
