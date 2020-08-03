# Multimedia Player

A multi media player featuring an audio player and a video player that can play audio/video from both local assets that come bundled with the app and from the network stream 

## About the Application
This app features an audio player that uses local assets bundled with the app to play the audio using [audioplayers](https://pub.dev/packages/audioplayers) plugin.
![Local Audio](/screeshots/1.png)

Along with audio player, this app also has a video player that uses local assets bundled with the app to play the audio using [video_player](https://pub.dev/packages/video_player) plugin.
![Local Video](/screeshots/2.png)

App has features a network stream option that plays audio and video from the network stream.
![Network Stream](/screeshots/3.png)
All these features have play/pause functionality and are just a basic implementation.

##Prerequisites
You must have flutter and android studio configured and installed on your system to run this project on either an emulator or an actual mobile phone.

##Getting Started
To run this project, clone this repository and traverse into your project directory through command line.
Then execute this command:
`flutter run -v`

##Future Scope
This project has lots of scopes and room for improvements in the future. The next/prev buttons on audio player can be made functional and lots of media can be used then. The app will have an option to load media from the local device. In the network stream option, we will have the user enter the url for the audio/video which the user wants to play.
