import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../pageDraggable.dart';
import 'openerWidgets.dart';

class ReDragText extends StatefulWidget {
  ReDragText({
    super.key,
    required this.getText,
  });

  final String getText;

  @override
  State<ReDragText> createState() => _ReDragTextState();
}

//Create Text Widget with Resizeable
class _ReDragTextState extends State<ReDragText> {
  double myWidth = 150;
  double myHeight = 100;
  double myPosX = 0;
  double myPosY = 0;
  Key key = UniqueKey();
  late double areaW;
  late double areaH;
  String resizeableText = "";
  bool isResizing = false;
  bool isVisible = false;
  Offset startPosition = const Offset(0, 0);

  Offset get getTextOffset => Offset(myPosX, myPosY);

  double get getTextWidth => myWidth;

  double get getTextHeight => myHeight;

  String get getText => widget.getText;

  Key get getKey => key;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    areaW = MediaQuery.sizeOf(context).width;
    areaH = MediaQuery.sizeOf(context).height;

    return Positioned(
      top: myPosY,
      left: myPosX,
      width: areaW,
      height: areaH,
      child: GestureDetector(
        onDoubleTap: () {
          context.read<PageDraggable>().addWidget(ReDragText(
                key: UniqueKey(),
                getText: widget.getText,
              ));
          print(
              "key : $key X : $myPosX Y: $myPosY Text: $getText Height: $myHeight Width : $myWidth");
          print("Double TaP ");
          //Temp
        },
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
              myPosX += details.delta.dx * 1 / 2;
              myPosY += details.delta.dy * 1 / 2;
              globalPosX = myPosX;
              globalPosY = myPosY;
            }
            if (isResizing) {
              if ((myWidth >= 50 && myHeight >= 50) &&
                  (myWidth <= (areaW - 30) && myHeight <= (areaH - 30)) &&
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
              } else if (myHeight < 50) {
                myHeight = 50;
              } else if (myWidth < 50) {
                myWidth = 50;
              } else {
                myHeight = 50;
                myWidth = 50;
              }
            }
            print("width : $myWidth | "
                "\nheight : $myHeight | "
                "\nStartPosition : $startPosition");

            print("\n$myWidth - $myHeight - $myPosX - $myPosY");
          });
        },
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });

          print("width : $myWidth | "
              "\nheight : $myHeight | "
              "\nStartPosition : $startPosition");
        },
        onPanEnd: (details) {
          setState(() {
            isResizing = false;
          });
        },
        child: Stack(
          children: [
            Positioned(
              top: myPosY - 60,
              left: myPosX,
              width: 170,
              height: 50,
              child: Visibility(visible: isVisible, child: OpenerTopWidget()),
            ),
            Positioned(
              width: myWidth,
              height: myHeight,
              left: myPosX,
              top: myPosY,
              child: Container(
                margin: EdgeInsets.only(left: containerLeft, top: containerTop),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    textWidthBasis: TextWidthBasis.parent,
                    textScaleFactor: 1,
                    widget.getText,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
