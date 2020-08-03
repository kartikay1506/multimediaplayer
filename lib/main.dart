import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:multimediaPlayer/UI/layout.dart';

import 'package:multimediaPlayer/UI/mediaPlayer.dart';

void main() {
  runApp(HotReloadApp());
}

class HotReloadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return mediaPlayer();
    //return layout();
  }
}
