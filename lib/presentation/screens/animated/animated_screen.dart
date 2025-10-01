import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  static const String routeName = 'animated_screen';

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.indigo;
  double _borderRadius = 8.0;

  void _changeShape() {
    final random = Random();

    setState(() {
      _width = random.nextInt(300) + 50;
      _height = random.nextInt(300) + 50;
      _borderRadius = random.nextInt(24) + 8;
      _color = Colors.primaries[random.nextInt(Colors.primaries.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: _AnimatedView(
        width: _width,
        height: _height,
        color: _color,
        borderRadius: _borderRadius,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}

class _AnimatedView extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double borderRadius;

  const _AnimatedView({
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.decelerate,
        width: width <= 0 ? 0 : width,
        height: height <= 0 ? 0 : height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            borderRadius <= 0 ? 0 : borderRadius,
          ),
        ),
      ),
    );
  }
}
