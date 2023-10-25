import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pageDraggable.dart';
import 'openerWidgets.dart';

class ReDragText extends StatefulWidget {
  const ReDragText({
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
  double myHeight = 150;
  double myPosX = 0;
  double myPosY = 0;
  late double areaW;
  late double areaH;
  String resizeableText = "";
  bool isResizing = false;
  bool isVisible = false;
  Offset startPosition = const Offset(0, 0);
  GlobalKey myKey = GlobalKey();
  TextEditingController txtController = TextEditingController();

  String get getText => widget.getText;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    areaW = MediaQuery.sizeOf(context).width;
    areaH = MediaQuery.sizeOf(context).height;
    if (getText != null) {
      txtController.text = getText;
    }
    return Positioned(
      top: myPosY,
      left: myPosX,
      width: areaW,
      height: areaH,
      //height: areaH,
      child: GestureDetector(
        onDoubleTap: () {
          context.read<PageDraggable>().addWidget(ReDragText(
                getText: widget.getText,
              ));
          print(
              " X : $myPosX Y: $myPosY Text: $getText Height: $myHeight Width : $myWidth");
          print("Double TaP ");
          //Temp
        },
        onPanStart: (details) {
          if (details.localPosition.dx >= myWidth - 15 &&
              details.localPosition.dy >= myHeight - 15) {
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
              myPosX = myPosX.clamp(0, areaW);
              myPosY = myPosY.clamp(0, areaH);
              //todo right and bottom side update notWorking
              double myRight = myPosX + myWidth;
              double myBottom = myPosY + myHeight;
              if (myPosX < 0) {
                myPosX = 0;
              } else if (myRight > areaW) {
                myRight = areaW;
              }
              if (myPosY < 0) {
                myPosY = 0;
              } else if (myBottom > areaH) {
                myBottom = areaH;
              }
            }
            if (isResizing) {
              if ((myWidth >= 50 && myHeight >= 50) &&
                  (myWidth <= (areaW) && myHeight <= (areaH)) &&
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
              top: myPosY,
              left: myPosX,
              width: myWidth,
              height: myHeight,
              child: Container(
                margin: EdgeInsets.only(left: containerLeft, top: containerTop),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: myWidth - 10,
                      height: myHeight - 10,
                      color: Colors.orangeAccent,
                      child: TextField(
                        controller: txtController,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.center,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: myPosY,
              left: myPosX,
              child: Visibility(
                  visible: isVisible, child: const OpenerTopWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
