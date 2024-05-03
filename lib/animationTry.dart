import 'package:flutter/material.dart';

class EaseInAnimationDemo extends StatefulWidget {
  @override
  _EaseInAnimationDemoState createState() => _EaseInAnimationDemoState();
}

class _EaseInAnimationDemoState extends State<EaseInAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = Duration(seconds: 1);
  final Curve _animationCurve = Curves.easeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    // Trigger the ease-in animation directly
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ease-In Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _controller.value,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}
