import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class LimitedSpaceGame extends FlameGame 
{
  @override
  Color backgroundColor() => const Color(0xFFFF0000);
  late final CameraComponent cam;
  final world = World();

  @override
  FutureOr<void> onLoad() {

    cam = CameraComponent.withFixedResolution(world: world, width: 108, height: 88);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);
    return super.onLoad();
  }

}