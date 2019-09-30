import 'dart:async';

import 'package:flutter/material.dart';

//从顶部进入到某一位置，弹簧回弹效果
class AnimText extends StatefulWidget {
  Duration duration;
  String text;
  double alignX;
  int delay;
  VoidCallback callback;

  AnimText(@required this.text, @required this.alignX, this.delay,
      {this.duration = const Duration(seconds: 2), this.callback})
      : assert(text != null && text.isNotEmpty),
        assert(alignX != null);

  @override
  _AnimTextState createState() => _AnimTextState();
}

class _AnimTextState extends State<AnimText>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    Tween<double> tween = Tween(begin: -1, end: -0.5);
    _animation = tween.animate(curve);
    //动画延迟执行
    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        if (widget.callback != null) {
          widget.callback();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Align(
              alignment: Alignment(widget.alignX, _animation.value),
              child: Text(
                widget.text,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none),
              ));
        });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
