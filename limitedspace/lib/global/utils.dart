bool checkCollision(player, block) {
  final playerX = player.position.x;
  final playerY = player.position.y;
  final playerWidth = player.width;
  final playerHeight = player.height;

  final blockX = block.x;
  final blockY = block.y;
  final blockWidth = block.width;
  final blockHeight = block.height;

  return (
    playerY < blockY + blockHeight && 
    playerY + playerHeight > blockY &&
    playerX < blockX + blockWidth &&
    playerX + playerWidth > blockX
  );
}

bool checkCollisionHorizontal(player, block) {
  final playerX = player.position.x;
  final playerY = player.position.y;
  final playerWidth = player.width;
  final playerHeight = player.height;

  final blockX = block.x;
  final blockY = block.y;
  final blockWidth = block.width;
  final blockHeight = block.height;

  return (

    playerX < blockX + blockWidth &&
    playerX + playerWidth > blockX
  );
}

bool checkCollisionVertical(player, block) {
  final playerX = player.position.x;
  final playerY = player.position.y;
  final playerWidth = player.width;
  final playerHeight = player.height;

  final blockX = block.x;
  final blockY = block.y;
  final blockWidth = block.width;
  final blockHeight = block.height;

  return (
    playerY < blockY + blockHeight && 
    playerY + playerHeight > blockY 

  );
}