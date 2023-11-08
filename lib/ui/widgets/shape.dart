import 'package:flutter/material.dart';

class RectangleShapeWidget extends StatefulWidget {
  const RectangleShapeWidget({
    super.key,
  });

  @override
  State<RectangleShapeWidget> createState() => _RectangleShapeWidgetState();
}

class _RectangleShapeWidgetState extends State<RectangleShapeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
    );
  }
}
