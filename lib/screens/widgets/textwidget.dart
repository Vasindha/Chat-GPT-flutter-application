// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  final String label;
  Color color;
  double size;
  FontWeight fontWeight;
  TextWidget({
    Key? key,
    required this.label,
    required this.color,
    this.size = 16,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
