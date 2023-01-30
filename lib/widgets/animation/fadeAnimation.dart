import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const FadeAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {

    final duration = MultiTrackTween([
        Track("opacity").add(Duration(milliseconds: 600), Tween(begin: 0.0, end: 1.0)),
        Track("translateY").add(Duration(milliseconds: 600), Tween(begin: -25.0, end: 0.0), curve: Curves.easeOut),
        
    ]);
    
    return ControlledAnimation(
      delay: Duration(milliseconds: (600 * delay).round()),
      duration: duration.duration,
      tween: duration,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
          offset: Offset(
            0, animation["translateY"]
          ),
          child: child,
        ),
      ),
    );
  }
}