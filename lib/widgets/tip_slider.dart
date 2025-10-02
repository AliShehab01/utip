import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double persentageTip,
    required this.onChanged,
  }) : _persentageTip = persentageTip;

  final double _persentageTip;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _persentageTip,
      onChanged: onChanged,
      min: 0,
      max: 0.5,
      divisions: 10,
      label: "${(_persentageTip * 100).round()}%",
    );
  }
}
