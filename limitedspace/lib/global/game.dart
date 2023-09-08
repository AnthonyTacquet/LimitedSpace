import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:limitedspace/global/world.dart';

class LimitedSpaceGame extends FlameGame 
{
  @override
  Color backgroundColor() => const Color(0xFFFF0000);
  late final CameraComponent cam;
  final world = LimitedSpaceWorld();

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(world: world, width: 480, height: 320);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);
    return super.onLoad();
  }

}