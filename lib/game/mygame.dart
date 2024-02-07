import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';

import 'room.dart';
import 'player.dart';
import 'components/tile.dart';

class MyGame extends FlameGame with HasKeyboardHandlerComponents {
  late Room _room;
  late Player _player;
  
  @override
  Future<void> onLoad() async {
    await images.loadAll(['minitileset.png']);

    camera.viewfinder.anchor = Anchor.center;

    // Initialize
    _room = Room(

    );
    world.add(_room);

    _player = Player(
      
    );
    world.add(_player);
  }
}

Sprite mySprite(double x, double y, double width, double height) {
  return Sprite(
    Flame.images.fromCache('minitileset.png'),
    srcPosition: Vector2(x, y),
    srcSize: Vector2(width, height),
  );
}