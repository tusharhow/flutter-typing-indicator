library flutter_typing_indicator;

import 'package:flutter/material.dart';

class TypingIndicator extends StatefulWidget {
  final Color dotColor;
  final Color backgroundColor;
  final double dotSize;
  final int dotCount;
  final Duration duration;
  final double padding;
  final BorderRadiusGeometry borderRadius;
  final BoxShape dotShape;
  final List<BoxShadow> dotShadow;
  final BoxBorder dotBorder;
  final Gradient dotGradient;
  final bool isGradient;
  final DecorationImage dotImage;
  final bool isDotImage;
  final Curve curve;

  const TypingIndicator({
    super.key,
    this.dotColor = Colors.grey,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.dotSize = 8.0,
    this.dotCount = 3,
    this.duration = const Duration(milliseconds: 1000),
    this.padding = 8.0,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12),
    ),
    this.dotShape = BoxShape.circle,
    this.dotShadow = const [],
    this.dotBorder = const Border(),
    this.dotGradient = const LinearGradient(
      colors: [Colors.grey, Colors.grey],
    ),
    this.isGradient = false,
    this.dotImage = const DecorationImage(
      image: AssetImage('assets/images/typing_indicator.png'),
      fit: BoxFit.cover,
    ),
    this.isDotImage = false,
    this.curve = Curves.easeInOut,
  });

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    // Create AnimationController
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();

    // Create staggered animations for each dot
    _animations = List.generate(widget.dotCount, (index) {
      final start = index * 0.2;
      final end = start + 0.6;
      return Tween<double>(begin: 0.1, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: widget.curve),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(widget.padding),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: widget.borderRadius,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              widget.dotCount,
              (index) => _AnimatedDot(
                animation: _animations[index],
                dotSize: widget.dotSize,
                dotColor: widget.dotColor,
                shape: widget.dotShape,
                boxShadow: widget.dotShadow,
                border: widget.dotBorder,
                gradient: widget.dotGradient,
                isGradient: widget.isGradient,
                image: widget.dotImage,
                isDotImage: widget.isDotImage,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AnimatedDot extends AnimatedWidget {
  final double dotSize;
  final Color dotColor;
  final BoxShape shape;
  final List<BoxShadow> boxShadow;
  final BoxBorder border;
  final Gradient gradient;
  final bool isGradient;
  final DecorationImage image;
  final bool isDotImage;

  const _AnimatedDot({
    required Animation<double> animation,
    required this.dotSize,
    required this.dotColor,
    required this.shape,
    required this.boxShadow,
    required this.border,
    required this.gradient,
    required this.isGradient,
    required this.image,
    required this.isDotImage,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Opacity(
        opacity: animation.value,
        child: Container(
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: dotColor,
            shape: shape,
            border: border,
            boxShadow: boxShadow,
            gradient: isGradient ? gradient : null,
            image: isDotImage ? image : null,
          ),
        ),
      ),
    );
  }
}
