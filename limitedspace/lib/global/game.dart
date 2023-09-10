import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:limitedspace/global/player.dart';
import 'package:limitedspace/global/world.dart';

class LimitedSpaceGame extends FlameGame with HasKeyboardHandlerComponents, DragCallbacks
{
  @override
  Color backgroundColor() => const Color(0xFF182030);
  late final CameraComponent cam;
  late JoystickComponent joyStick;
  LimitedSpacePlayer player = LimitedSpacePlayer();

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    final world = LimitedSpaceWorld(player: player);

    cam = CameraComponent.withFixedResolution(world: world, width: 800, height: 480);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);

    addJoyStick();

    return super.onLoad();
  }

  addJoyStick()
  {
    //joyStick = JoystickComponent(
      
    //);
  }

}