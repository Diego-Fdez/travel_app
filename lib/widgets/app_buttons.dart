import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

// ignore: must_be_immutable
class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  AppButtons(
      {this.text = 'hi',
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor,
      this.isIcon = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 1.0)),
      child: isIcon == false
          ? Center(child: AppText(text: text!, color: color))
          : Icon(icon, color: color),
    );
  }
}
