import 'dart:async';
import 'package:flutter/material.dart';
import 'bicycle_painter.dart';
import 'newspaper_flyer.dart';

class BicycleAnimation extends StatefulWidget {
  const BicycleAnimation({super.key});

  @override
  State<BicycleAnimation> createState() => _BicycleAnimationState();
}

class _BicycleAnimationState extends State<BicycleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _bikeX = -200;
  double _newspaperScale = 0.0;
  bool _showNewspaper = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });

    _controller.addListener(() {
      setState(() {
        _bikeX += 2;
        if (_bikeX > 150) {
          _bikeX = 150;
          _triggerNewspaperAnimation();
        }
      });
    });

    _controller.forward();
  }

  void _triggerNewspaperAnimation() {
    if (_showNewspaper) return;

    _showNewspaper = true;
    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        _newspaperScale += 0.05;
        if (_newspaperScale >= 2.5) {
          timer.cancel();
          _resetAnimation();
        }
      });
    });
  }

  void _resetAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _bikeX = -200;
        _newspaperScale = 0.0;
        _showNewspaper = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: const Size(double.infinity, double.infinity),
          painter: BicyclePainter(bikeX: _bikeX),
        ),
        if (_showNewspaper) NewspaperFlyer(scale: _newspaperScale),
      ],
    );
  }
}
