import 'package:flutter/material.dart';

class OvalTextWidget extends StatelessWidget {
  final double? shapeWidth;
  final double? shapeHeight;
  bool isActive = false;
  static const double defaultSizeWidth = 100;
  static const double defaultSizeHeight = 100;

  OvalTextWidget({
    super.key,
    this.shapeWidth = defaultSizeWidth,
    this.shapeHeight = defaultSizeHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: shapeWidth,
          height: shapeHeight,
          child: TextField(
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
            textAlign: TextAlign.center,
            maxLines: null,
            decoration:
            const InputDecoration(
              border: InputBorder.none,
            ),
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
