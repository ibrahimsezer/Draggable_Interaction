import 'dart:math';
import 'package:draggable_example/model/example.dart';
import 'package:draggable_example/ui/pageDraggable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key, required this.mykey});

  final UniqueKey mykey;

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  double myWidth = 200;
  double myHeight = 200;
  double myPosX = 0;
  double myPosY = 0;
  late double right;
  late double areaW;
  late double areaH;
  String resizeableText = "";
  bool isResizing = false;
  bool isVisible = false;
  Offset startPosition = const Offset(0, 0);
  UniqueKey myKey = UniqueKey();
  List deleteKeyList = [];

  @override
  Widget build(BuildContext context) {
    areaW = MediaQuery.sizeOf(context).width;
    areaH = MediaQuery.sizeOf(context).height;
    return Positioned(
        top: myPosY,
        left: myPosX,
        width: myWidth,
        height: myHeight,
        child: GestureDetector(
          key: myKey,
          child: Container(
            color: Colors.black,
          ),
          onTap: () {
            setState(() {
              UniqueKey deleteKey = myKey;
              var listKey = deleteKey;
              deleteKeyList.add(listKey);
              print("$deleteKey");
              for (int i = 0; i < deleteKeyList.length; i++) {
                print(deleteKeyList.toList());
                if (deleteKey == deleteKeyList[i]) {
                  context.read<PageDraggable>().removeWidgetInt(i);
                  deleteKeyList.removeAt(i);
                }
              }
            });
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
                myPosX += details.delta.dx;
                myPosY += details.delta.dy;
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
                } else if (myHeight < 50) {
                  myHeight = 50;
                } else if (myWidth < 50) {
                  myWidth = 50;
                }
              }
            });
          },
          onPanEnd: (details) {
            setState(() {
              isResizing = false;
            });
          },
        ));
  }
}
