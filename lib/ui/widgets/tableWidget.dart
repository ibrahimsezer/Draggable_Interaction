import 'dart:math';

import 'package:flutter/material.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  double width = 100;
  double height = 100;
  double posx = 0;
  double posy = 0;
  late double areaW;
  late double areaH;
  bool isResizing = false;
  Offset startPosition = const Offset(0, 0);
  double right = 0;

  @override
  Widget build(BuildContext context) {
    areaW = MediaQuery.sizeOf(context).width;
    areaH = MediaQuery.sizeOf(context).height;
    return Positioned(
        top: posy,
        left: posx,
        width: areaW,
        height: areaH,
        child: GestureDetector(
          onPanStart: (details) {
            if (details.localPosition.dx >= width - 15 &&
                details.localPosition.dy >= height - 15) {
              setState(() {
                isResizing = true;
                startPosition = details.localPosition;
              });
            }
          },
          onPanUpdate: (details) {
            setState(() {
              if (!isResizing) {
                posx += details.delta.dx / 2;
                posy += details.delta.dy / 2;
                posx = posx.clamp(0, areaW);
                posy = posy.clamp(0, areaH);
                right = posx + width;
                if (right > areaW) {
                  right = areaW;
                }
              }
              if (isResizing) {
                double dx = details.localPosition.dx - startPosition.dx;
                double dy = details.localPosition.dy - startPosition.dy;
                width += dx;
                height += dy;
                startPosition = details.localPosition;
              }
              if (height < 50) {
                height = 50;
              }
              if (width < 50) {
                width = 50;
              }
            });
          },
          onPanEnd: (details) {
            setState(() {
              isResizing = false;
            });
          },
          child: Stack(children: [
            Positioned(
                top: posy,
                left: posx,
                width: width,
                height: height,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: width - 10,
                      height: height - 10,
                      color: Colors.orangeAccent,
                      child: const TextField(
                        textAlign: TextAlign.center,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  )),
                ))
          ]),
        ));
  }
}
