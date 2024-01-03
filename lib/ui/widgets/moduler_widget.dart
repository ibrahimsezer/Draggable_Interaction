import 'package:draggable_example/providers/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModularWidget extends StatefulWidget {
  final int id;
  final Widget modularWidget;
  double modularPosX;
  double modularPosY;
  double modularWidth;
  double modularHeight;

  ModularWidget(
      {super.key,
      required this.modularPosX,
      required this.modularPosY,
      required this.modularHeight,
      required this.modularWidth,
      required this.modularWidget,
      required this.id});

  @override
  State<ModularWidget> createState() => _ModularWidgetState();
}

class _ModularWidgetState extends State<ModularWidget> {
  late double areaW;
  late double areaH;
  bool isResizing = false;
  bool isVisible = false;
  Offset startPosition = const Offset(0, 0);
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    areaW = MediaQuery.sizeOf(context).width;
    areaH = MediaQuery.sizeOf(context).height;
    return Consumer<WidgetProvider>(builder: (c, widgetProvider, w) {
      return Positioned(
          top: widget.modularPosY + widgetProvider.posOffsetY,
          left: widget.modularPosX + widgetProvider.posOffsetX,
          height: widget.modularHeight,
          width: widget.modularWidth,
          child: GestureDetector(
            onTap: () {
              int clickedWidgetId = widget.id; //clicked widget ID
            },
            onPanStart: (details) {
              if (details.localPosition.dx >= widget.modularWidth - 20 &&
                  details.localPosition.dy >= widget.modularHeight - 20) {
                setState(() {
                  isResizing = true;
                  startPosition = details.localPosition;
                });
              }
            },
            onPanUpdate: (details) {
              setState(() {
                if (!isResizing) {
                  widget.modularPosX += details.delta.dx;
                  widget.modularPosY += details.delta.dy;
                }
                if (isResizing) {
                  if ((widget.modularWidth >= 25 &&
                          widget.modularHeight >= 25) &&
                      (widget.modularWidth <= areaW &&
                          widget.modularHeight <= areaH) &&
                      (startPosition.dx <= areaW && startPosition.dy >= 0) &&
                      (startPosition.dy <= areaH && startPosition.dy >= 0)) {
                    double dx = details.localPosition.dx - startPosition.dx;
                    double dy = details.localPosition.dy - startPosition.dy;
                    widget.modularWidth += dx;
                    widget.modularHeight += dy;
                    startPosition = details.localPosition;
                  } else if (widget.modularHeight < 35) {
                    widget.modularHeight += 1;
                  } else if (widget.modularWidth < 35) {
                    widget.modularWidth += 1;
                  }
                }
              });
            },
            onPanEnd: (details) {
              setState(() {
                isResizing = false;
              });
            },
            child: widget.modularWidget,
          ));
    });
  }
}
