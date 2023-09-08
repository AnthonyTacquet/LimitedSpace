import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/src/services/raw_keyboard.dart';
import 'package:limitedspace/global/collision_block.dart';
import 'package:limitedspace/global/game.dart';
import 'package:limitedspace/global/utils.dart';

enum PlayerState { idle, running }

class LimitedSpacePlayer extends SpriteAnimationGroupComponent with HasGameRef<LimitedSpaceGame>, KeyboardHandler
{
  late final SpriteAnimation idleAnimation;

  double horizontalMovement = 0;
  double verticalMovement = 0;
  double moveSpeed = 100;
  Vector2 velocity = Vector2.zero();
  List<CollisionBlock> collisionBlocks = [];

  LimitedSpacePlayer({position}) : super(position: position);

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    debugMode = true;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _updatePlayerMovement(dt);
    _checkHorizontalCollisions();
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalMovement = 0;
    verticalMovement = 0;
    final isLeftKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyA) || keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyD) || keysPressed.contains(LogicalKeyboardKey.arrowRight);
    final isUpKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyW) || keysPressed.contains(LogicalKeyboardKey.arrowUp);
    final isDownKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyS) || keysPressed.contains(LogicalKeyboardKey.arrowDown);

    horizontalMovement += isLeftKeyPressed ? -1 : 0;
    horizontalMovement += isRightKeyPressed ? 1 : 0;
    verticalMovement += isUpKeyPressed ? -1 : 0;
    verticalMovement += isDownKeyPressed ? 1 : 0;

    
    return super.onKeyEvent(event, keysPressed);
  }

  void _loadAllAnimations() {
    idleAnimation = SpriteAnimation.fromFrameData(
      game.images.fromCache('Man.png'),
      SpriteAnimationData.sequenced(
        amount: 1, 
        stepTime: 1, 
        textureSize: Vector2.all(48)
      ),
    );

    // List of all animations
    animations = {PlayerState.idle: idleAnimation};

    // Set current animation
    current = PlayerState.idle;
  }

  void _updatePlayerMovement(double dt)
  {
    velocity.x = horizontalMovement * moveSpeed;
    velocity.y = verticalMovement * moveSpeed;
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;

  }

  void _checkHorizontalCollisions()
  {
    for (final block in collisionBlocks) {
      if (checkCollision(this, block)){
        if (velocity.x > 0){
          velocity.x = 0;
          position.x = block.x - width;
        }

        if (velocity.x < 0){
          velocity.x = 0;
          position.x = block.x + block.width - width;
        }

        if (velocity.y > 0){
          velocity.y = 0;
          position.y = block.y - height;
        }

        if (velocity.y < 0){
          velocity.y = 0;
          position.y = block.y + block.height + height;
        }
      }
    }
  }


}