import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';

import 'game/mygame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(),
        body: Transform.scale(
          scale: 2.0,
          child: GameWidget.controlled(gameFactory: MyGame.new),
        ),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }

}