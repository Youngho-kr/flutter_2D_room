

import 'package:flame/components.dart';

import '../mygame.dart';

/*
   0: Modern
   1: Glass
   2: Iron
   3: Toilet
   4: Brick
*/
class Tile extends SpriteComponent with HasGameReference<MyGame> {
  factory Tile.fromInt(int index) {
    return myTile[index];
  }

  Tile._(this.value, double x, double y, double width, double height)
    : sprite = mySprite(x, y, width, height);

  int value;
  final Sprite sprite;

  static final List<Tile> myTile = [
    Tile._(0, 0, 0, 16, 16),
    Tile._(1, 0, 48, 16, 16),
    Tile._(2, 0, 96, 16, 16),
    Tile._(3, 16, 96, 16, 16),
    Tile._(4, 0, 32, 16, 16),
  ];

}