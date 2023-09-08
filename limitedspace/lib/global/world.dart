import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:limitedspace/global/player.dart';

class LimitedSpaceWorld extends World 
{
  late TiledComponent map;

  @override
  FutureOr<void> onLoad() async{
    map = await TiledComponent.load("DungeonTiles.tmx", Vector2.all(16));

    add(map);
    add(LimitedSpacePlayer());

    return super.onLoad();
  }

}