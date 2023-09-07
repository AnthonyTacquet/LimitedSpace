import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:limitedspace/global/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  LimitedSpaceGame game = LimitedSpaceGame();
  runApp(GameWidget(game: kDebugMode ? LimitedSpaceGame() : game));
}

