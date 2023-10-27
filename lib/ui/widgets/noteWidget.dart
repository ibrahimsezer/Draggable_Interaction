import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pageDraggable.dart';
import 'openerWidgets.dart';

class NoteWidget extends StatefulWidget {
   const NoteWidget({
    super.key,
    required getText, required this.myid,
  });
   final int myid;

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

//Create Text Widget with Resizeable
class _NoteWidgetState extends State<NoteWidget> {

  double myWidth = 150;
  double myHeight = 150;
  double myPosX = 0;
  double myPosY = 0;
  late double right;
  late double areaW;
  late double areaH;
  String resizeableText = "";
  bool isResizing = false;
  bool isVisible = false;
  Offset startPosition = const Offset(0, 0);
  GlobalKey myKey = GlobalKey();
  TextEditingController txtController = TextEditingController();

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
              right = myPosX + myWidth;
              right.clamp(0, areaW);
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
                        onChanged: (value) {
                          log(txtController.text);
                          log("tempText : $tempText");
                          tempText = txtController.text;
                        },
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
