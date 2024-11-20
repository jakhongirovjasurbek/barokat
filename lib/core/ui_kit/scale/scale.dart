import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleX extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final VoidCallback? onLongTap;
  final Duration duration;
  final double scaleValue;
  final bool isDisabled;

  const ScaleX({
    required this.child,
    required this.onTap,
    this.isDisabled = false,
    this.duration = const Duration(milliseconds: 150),
    this.scaleValue = 0.95,
    this.onLongTap,
    super.key,
  }) : assert(
          scaleValue <= 1 && scaleValue >= 0,
          'scale value should be in the range [0,1]',
        );

  @override
  _ScaleXState createState() => _ScaleXState();
}

class _ScaleXState extends State<ScaleX>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: widget.scaleValue,
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _controller,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (!widget.isDisabled) {
            widget.onTap();
          }
        },
        onLongPress: () {
          if (!widget.isDisabled) {
            if (widget.onLongTap != null) {
              widget.onLongTap!();
            }
          }
        },
        onPanDown: (details) {
          if (!widget.isDisabled) {
            _controller.forward();
          }
        },
        onPanCancel: () {
          if (!widget.isDisabled) {
            _controller.reverse();
          }
        },
        onPanEnd: (details) {
          if (!widget.isDisabled) {
            _controller.reverse();
          }
        },
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: widget.child,
        ),
      );
}
