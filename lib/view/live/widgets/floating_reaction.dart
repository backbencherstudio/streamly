import 'dart:math';
import 'package:flutter/material.dart';

class FloatingReaction extends StatefulWidget {
  const FloatingReaction({Key? key}) : super(key: key);

  @override
  State<FloatingReaction> createState() => _FloatingReactionState();
}

class _FloatingReactionState extends State<FloatingReaction> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _moveUp;
  final double _left = 250 + Random().nextDouble() * 50;
  final double _size = 18 + Random().nextDouble() * 10;
  final double _start = 80;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _moveUp = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Positioned(
          bottom: _start + _moveUp.value,
          left: _left,
          child: Opacity(
            opacity: 1.0 - (_moveUp.value / 150),
            child: Icon(Icons.favorite, color: Colors.redAccent, size: _size),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
