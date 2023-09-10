import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:limitedspace/global/collision_block.dart';
import 'package:limitedspace/global/player.dart';

class LimitedSpaceWorld extends World 
{
  late TiledComponent map;
  final LimitedSpacePlayer player;
  List<CollisionBlock> collisionBlocks = [];

  LimitedSpaceWorld({required this.player});

  @override
  FutureOr<void> onLoad() async{
    map = await TiledComponent.load("LunarMap.tmx", Vector2.all(16));

    add(map);

    final spawnPointsLayer = map.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    if (spawnPointsLayer != null)
    {
      for (final spawnPoint in spawnPointsLayer.objects) {
        switch (spawnPoint.class_) {
          case 'Player':
            player.position = Vector2(spawnPoint.x, spawnPoint.y);
            add(player);
            break;
          default:
        }
      }
    }

    final collisionsLayer = map.tileMap.getLayer<ObjectGroup>('Collisions');

    if (collisionsLayer != null)
    {
      for (final collision in collisionsLayer.objects)
      {
        switch (collision.class_) {
          default:
            final block = CollisionBlock(
              position: Vector2(collision.x, collision.y),
              size: Vector2(collision.width, collision.height),
            );
            collisionBlocks.add(block);
            add(block);
        }
      }
    }

    player.collisionBlocks = collisionBlocks;

    return super.onLoad();
  }

}