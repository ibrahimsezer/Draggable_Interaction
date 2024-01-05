import 'package:draggable_example/providers/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/widget_model.dart';

class ModularWidget extends StatefulWidget {
  final WidgetModel model;
  final Widget child;

  const ModularWidget({super.key, required this.model, required this.child});

  @override
  State<ModularWidget> createState() => _ModularWidgetState();
}

class _ModularWidgetState extends State<ModularWidget> {
  late double areaW;
  late double areaH;
  bool isResizing = false;
  bool isVisible = false;
  Offset startPosition = const Offset(0, 0);

  late double posX;
  late double posY;
  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
    assignValues();
  }

  void assignValues() {
    posX = widget.model.posX;
    posY = widget.model.posY;
    width = widget.model.width;
    height = widget.model.height;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    areaW = size.width;
    areaH = size.height;
    return Consumer<WidgetProvider>(builder: (c, widgetProvider, w) {
      return Positioned(
          top: posY + widgetProvider.posOffsetY,
          left: posX + widgetProvider.posOffsetX,
          height: height,
          width: width,
          child: GestureDetector(
            onTap: () {},
            onPanStart: (details) {
              if (details.localPosition.dx >= width - 20 &&
                  details.localPosition.dy >= height - 20) {
                setState(() {
                  isResizing = true;
                  startPosition = details.localPosition;
                });
              }
            },
            onPanUpdate: (details) {
              setState(() {
                if (!isResizing) {
                  posX += details.delta.dx;
                  posY += details.delta.dy;
                }
                if (isResizing) {
                  if ((width >= 25 && height >= 25) &&
                      (width <= areaW && height <= areaH) &&
                      (startPosition.dx <= areaW && startPosition.dy >= 0) &&
                      (startPosition.dy <= areaH && startPosition.dy >= 0)) {
                    double dx = details.localPosition.dx - startPosition.dx;
                    double dy = details.localPosition.dy - startPosition.dy;
                    width += dx;
                    height += dy;
                    startPosition = details.localPosition;
                  } else if (height < 35) {
                    height += 1;
                  } else if (width < 35) {
                    width += 1;
                  }
                }
              });
            },
            onPanEnd: (details) {
              setState(() {
                isResizing = false;
              });
            },
            child: widget.child,
          ));
    });
  }
}
