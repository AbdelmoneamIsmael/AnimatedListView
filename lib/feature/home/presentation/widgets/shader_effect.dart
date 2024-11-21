import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShaderEffect extends StatefulWidget {
  const ShaderEffect({
    super.key,
  });

  @override
  State<ShaderEffect> createState() => _ShaderEffectState();
}

class _ShaderEffectState extends State<ShaderEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController.unbounded(vsync: this)
      ..repeat(
        min: 0.5,
        max: 1.5,
        period: const Duration(seconds: 1),
      );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: const [Colors.white10, Colors.white, Colors.white10],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, 0.3, 1],
            tileMode: TileMode.repeated,
            transform: SliderGrediantTransform(present: _controller.value),
          ).createShader(bounds),
          child: child,
        );
      },
      child: const Column(
        children: [
          Align(
            heightFactor: .4,
            child: FaIcon(
              FontAwesomeIcons.chevronUp,
              color: Colors.white,
            ),
          ),
          Align(
            heightFactor: .4,
            child: FaIcon(
              FontAwesomeIcons.chevronUp,
              color: Colors.white,
            ),
          ),
          Align(
            heightFactor: .4,
            child: FaIcon(
              FontAwesomeIcons.chevronUp,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class SliderGrediantTransform extends GradientTransform {
  final double present;

  const SliderGrediantTransform({required this.present});
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(0, -(bounds.height * present), 0);
  }
}
