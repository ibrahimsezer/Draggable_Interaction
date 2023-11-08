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
            if (details.localPosition.dx >= widget.initialWidth - 15 &&
                details.localPosition.dy >= widget.initialHeight - 15) {
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
                if ((widget.initialWidth >= 100 &&
                        widget.initialHeight >= 100) &&
                    (widget.initialWidth <= areaW &&
                        widget.initialHeight <= areaH) &&
                    (startPosition.dx <= areaW && startPosition.dy >= 0) &&
                    (startPosition.dy <= areaH && startPosition.dy >= 0)) {
                  double dx = details.localPosition.dx - startPosition.dx;
                  double dy = details.localPosition.dy - startPosition.dy;
                  widget.initialWidth += dx;
                  widget.initialHeight += dy;
                  startPosition = details.localPosition;
                } else if (widget.initialHeight < 100) {
                  widget.initialHeight = 100;
                } else if (widget.initialWidth < 100) {
                  widget.initialWidth = 100;
                }
              }
            });
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

class RoundedRectangleShapeWidget extends StatefulWidget {
  const RoundedRectangleShapeWidget({super.key});

  @override
  State<RoundedRectangleShapeWidget> createState() =>
      _RoundedRectangleShapeWidgetState();
}

class _RoundedRectangleShapeWidgetState
    extends State<RoundedRectangleShapeWidget> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.black)),
    );
  }
}
