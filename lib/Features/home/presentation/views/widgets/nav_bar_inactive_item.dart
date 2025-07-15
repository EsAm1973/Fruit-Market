import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class InActiveIcon extends StatelessWidget {
  const InActiveIcon({super.key, required this.iconPath});
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconPath, width: 20, height: 20);
  }
}
