import 'dart:developer';
import 'package:flutter/cupertino.dart';
import '../mainBoard.dart';
import 'openerWidget.dart';

///Resizeable Widgets

class ResizeableTextWidget extends StatefulWidget {
  const ResizeableTextWidget({super.key});

  @override
  State<ResizeableTextWidget> createState() => _ResizeableTextWidgetState();
}

class _ResizeableTextWidgetState extends State<ResizeableTextWidget> {
  double myPosX = 0;
  double myPosY = 0;

  double myWidth = 100;
  double myHeight = 100;

  @override
  Widget build(BuildContext context) {
    double areaW = MediaQuery.sizeOf(context).width;
    double areaH = MediaQuery.sizeOf(context).height;

    return Positioned(
      //Top widget
      top: myPosY,
      left: myPosX,
      width: 230,
      height: 50,
      child: GestureDetector(
        onPanStart: (details) {
          if (details.localPosition.dx >= myWidth - 20 &&
              details.localPosition.dy >= myHeight - 20) {
            setState(() {
              isResizing = true;
              startPosition = details.localPosition;
            });
          }
        },
        onPanUpdate: (details) {
          setState(() {
            if (!isResizing) {
              myPosX += details.delta.dx;
              myPosY += details.delta.dy;
            }

            if (isResizing) {
              if ((myWidth >= 50 && myHeight >= 50) &&
                  (myWidth <= (areaW - 10) && myHeight <= (areaH - 10)) &&
                  (startPosition.dx <= areaW && startPosition.dx >= 0) &&
                  (startPosition.dy <= areaH && startPosition.dy >= 0)) {
                double dx = details.localPosition.dx - startPosition.dx;
                double dy = details.localPosition.dy - startPosition.dy;
                myWidth += dx;
                myHeight += dy;
                startPosition = details.localPosition;

                print("width : $myWidth | dx : +$dx"
                    "\nheight : $myHeight | dy : +$dy"
                    "\nStartPosition : $startPosition");
              } else if (myHeight <= 50) {
                myHeight = 51;
              } else if (myWidth <= 50) {
                myWidth = 50;
              } else {
                myHeight = 51;
                myWidth = 51;
              }
            }
          });
        },
        onPanEnd: (details) {
          setState(() {
            isResizing = false;
          });
        },
        child: const OpenerTopWidget(),
      ),
    );
  }
}
