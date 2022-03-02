// import 'dart:html';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent with HasGameRef<SpaceShooterGame> {
  // final Paint _paint = Paint()..color = Colors.orange.shade500;
  Paint _paint = Paint();
  int _velocityX = 1;
  double _totalDt = 0.0;
  double _startY = 0.0;
  double _sinY = 0.0;

  Player(Color color) {
    debugMode = true;
    width = 20;
    height = 20;
    anchor = Anchor.center;

    _paint.color = color;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final random = Random();
    _startY = (gameRef.size.y / 2) + random.nextDouble() * 200 - 100;
    _velocityX = random.nextInt(30) + 1;
    _sinY = random.nextDouble() * 100.0 + 100.0;

    position.x = gameRef.size.x / 2;
    position.y = _startY;
  }

  @override
  void render(Canvas canvas) {
    debugMode = true;
    canvas.drawRect(size.toRect(), _paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _totalDt += dt;
    if (position.x <= size.x / 2 || position.x >= gameRef.size.x - size.x / 2) {
      _velocityX *= -1;
    }

    position.x = position.x + (1 * _velocityX);
    position.y = _startY + sin(_totalDt * 5 / pi) * 100;

    // print(
    //     "position.x : ${position.x + (size.x / 2)}, screenWidth : ${gameRef.size.x}");
  }
}

class SpaceShooterGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    // print("SpaceShooterGame size : " + size.toString());
    add(Player(Colors.blue.shade800));
    add(Player(Colors.red.shade800));
    add(Player(Colors.orange.shade300));
    add(Player(Colors.teal.shade600));
    add(Player(Colors.indigo.shade600));
    add(Player(Colors.white));
    add(Player(Colors.pink.shade500));
  }
}

class MyGame extends StatelessWidget {
  const MyGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: SpaceShooterGame());
  }
}
