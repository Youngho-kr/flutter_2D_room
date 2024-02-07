import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'mygame.dart';

class Player extends SpriteAnimationComponent 
    with KeyboardHandler, HasGameReference<MyGame> {
  Player();

  /*
     index
     0: Left
     1: Right
     2: Up
     3: Down
  */
  // late List<SpriteSheet> spriteSheet;
  late SpriteSheet spriteSheet;
  int spriteSheetSize = 4;
  /* Initial player direction -> down */
  int playerDirection = 3;

  @override
  Future<void> onLoad() async {

    final image = game.images.fromCache('minitileset.png');
    // for(var i = 0; i < spriteSheetSize; i++) {
    //   spriteSheet[i] = SpriteSheet(
    //     image: image,
    //     srcSize: Vector2.all(16),
    //   );
    // }
    spriteSheet = SpriteSheet(
      image: image,
      srcSize: Vector2.all(16),
    );
    
    switch (playerDirection) {
      case 0: // Left
        animation = SpriteAnimation.fromFrameData(
          image,
          SpriteAnimationData([
            spriteSheet.createFrameData(5, 2, stepTime: 0.3),
            spriteSheet.createFrameData(5, 3, stepTime: 0.3),
          ]),
        );
        break;
      case 1: // Right
        animation = SpriteAnimation.fromFrameData(
          image,
          SpriteAnimationData([
            spriteSheet.createFrameData(5, 0, stepTime: 0.3),
            spriteSheet.createFrameData(5, 1, stepTime: 0.3),
          ]),
        );
        break;
      case 2: // Up
        animation = SpriteAnimation.fromFrameData(
          image,
          SpriteAnimationData([
            spriteSheet.createFrameData(6, 2, stepTime: 0.3),
            spriteSheet.createFrameData(6, 3, stepTime: 0.3),
          ]),
        );
        break;
      case 3: // Down
        animation = SpriteAnimation.fromFrameData(
          image,
          SpriteAnimationData([
            spriteSheet.createFrameData(6, 0, stepTime: 0.3),
            spriteSheet.createFrameData(6, 1, stepTime: 0.3),
          ]),
        );
        break;
    }
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    int newDirection = -1;
    if(keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      newDirection = 0;
    } if(keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      newDirection = 1;
    } if(keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      newDirection = 2;
    } if(keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      newDirection = 3;
    }

    if(newDirection != playerDirection) {
      playerDirection = newDirection;
      onLoad();
    }

    return true;
  }


  @override
  void update(double dt) {
    // switch (playerDirection) {
    //   case 0: // Left

    //     break;
    //   case 1: // Right
    //   case 2: // Up
    //   case 3: // Down
    // }

    super.update(dt);
  }
}