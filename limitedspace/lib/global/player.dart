import 'dart:async';

import 'package:flame/components.dart';
import 'package:limitedspace/global/game.dart';

enum PlayerState { idle, running }

class LimitedSpacePlayer extends SpriteAnimationGroupComponent with HasGameRef<LimitedSpaceGame>
{
  late final SpriteAnimation idleAnimation;


  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
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

}