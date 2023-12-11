import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

bool isPointInWidget(Offset position, GlobalKey key) {
  RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
  renderBox.paint(PaintingContext(ContainerLayer(), Rect.zero), position);
  if (renderBox != null) {
    Offset localPosition = renderBox.globalToLocal(position);
    Rect widgetRect = Offset.zero & renderBox.size; //size calculation
    return widgetRect.contains(localPosition);
  }

  return false;
}

class AreaControlWidget extends StatefulWidget {
  AreaControlWidget({super.key});

  @override
  State<AreaControlWidget> createState() => _AreaControlWidgetState();
}

class _AreaControlWidgetState extends State<AreaControlWidget> {
  GlobalKey myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double areaH = MediaQuery.sizeOf(context).height;
    double areaW = MediaQuery.sizeOf(context).width;
    return Positioned(
      top: 0,
      left: 0,
      child: GestureDetector(
        key: myKey,
        onPanUpdate: (details) {
          Offset position = details.globalPosition;
          bool isInWidget = isPointInWidget(position, myKey);
          if (isInWidget) {
          } else {
          }
        },
        child: Container(color: Colors.amber,
          width: areaW,
          height: areaH,
        ),
      ),
    );
  }
}
