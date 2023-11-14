import 'package:flutter/material.dart';

class ModulerWidget extends StatefulWidget {
  double initialHeight;
  double initialWidth;
  double myPosX;
  double myPosY;
  final Widget widgetVariable;

  ModulerWidget(
      {super.key,
      required this.myPosX,
      required this.myPosY,
      required this.initialHeight,
      required this.initialWidth,
      required this.widgetVariable});

  @override
  State<ModulerWidget> createState() => _ModulerWidgetState();
}

class _ModulerWidgetState extends State<ModulerWidget> {
  late double areaW;
  late double areaH;
  bool isResizing = false;
  bool isVisible = false;
  Offset startPosition = const Offset(0, 0);
  double rotationAngle = 0.0; // Döndürme açısı

  @override
  Widget build(BuildContext context) {
    areaW = MediaQuery.sizeOf(context).width;
    areaH = MediaQuery.sizeOf(context).height;
    return Positioned(
        top: widget.myPosY,
        left: widget.myPosX,
        height: widget.initialHeight,
        width: widget.initialWidth,
        child: GestureDetector(
          onPanStart: (details) {
            if (details.localPosition.dx >= widget.initialWidth - 20 &&
                details.localPosition.dy >= widget.initialHeight - 20) {
              setState(() {
                isResizing = true;
                startPosition = details.localPosition;
              });
            }
          },
          onPanUpdate: (details) {
            setState(() {
              if (!isResizing) {
                widget.myPosX += details.delta.dx;
                widget.myPosY += details.delta.dy;
                widget.myPosX = widget.myPosX.clamp(0, areaW);
                widget.myPosY = widget.myPosY.clamp(0, areaH);
              }
              if (isResizing) {
                if ((widget.initialWidth >= 25 && widget.initialHeight >= 25) &&
                    (widget.initialWidth <= areaW &&
                        widget.initialHeight <= areaH) &&
                    (startPosition.dx <= areaW && startPosition.dy >= 0) &&
                    (startPosition.dy <= areaH && startPosition.dy >= 0)) {
                  double dx = details.localPosition.dx - startPosition.dx;
                  double dy = details.localPosition.dy - startPosition.dy;
                  widget.initialWidth += dx;
                  widget.initialHeight += dy;
                  startPosition = details.localPosition;
                } else if (widget.initialHeight < 25) {
                  widget.initialHeight = 25;
                } else if (widget.initialWidth < 25) {
                  widget.initialWidth = 25;
                }
              }
            });

            //
            // double centerX = widget.myPosX + widget.initialWidth / 2;
            // double centerY = widget.myPosY + widget.initialHeight / 2;
            // double angle = -1 * (startPosition.dx - details.localPosition.dx) /
            //     100; // Döndürme açısını hesaplayın
            // setState(() {
            //   var variable = Transform.rotate(angle: angle,child: widget.widgetVariable);
            //   rotationAngle += angle;
            //   variable.transform =
            //   Matrix4.identity()..rotateZ(rotationAngle);
            // });
            // startPosition = details.localPosition;
          },
          onPanEnd: (details) {
            setState(() {
              isResizing = false;
            });
          },
          child: widget.widgetVariable,
        ));
  }
}

///
