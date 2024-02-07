import 'package:flame/components.dart';

import 'mygame.dart';
import 'components/tile.dart';

class Room extends SpriteComponent with HasGameReference<MyGame> {
  @override
  Future<void> onLoad() async {
    final Tile tileImage = Tile.fromInt(4);

    sprite = tileImage.sprite;
  }
}