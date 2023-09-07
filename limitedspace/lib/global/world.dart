import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class LimitedSpaceWorld extends World 
{
  late TiledComponent map;

  @override
  FutureOr<void> onLoad() async{
    map = await TiledComponent.load("Background.tmx", Vector2.all(16));

    add(map);

    return super.onLoad();
  }

}