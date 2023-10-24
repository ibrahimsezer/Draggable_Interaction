import 'package:draggable_example/ui/pageDraggable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StickyNoteWidget extends StatefulWidget {
  const StickyNoteWidget({super.key, required this.position});
  final double position;
  @override
  State<StickyNoteWidget> createState() => _StickyNoteWidgetState();
}

class _StickyNoteWidgetState extends State<StickyNoteWidget> {
  double myWidth = 150;
  double myHeight = 150;
  double myPosX = 0;
  double myPosY = 0;
  late double areaW;
  late double areaH;
  bool isResizing = false;
  Offset startPosition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    areaW = MediaQuery.sizeOf(context).width;
    areaH = MediaQuery.sizeOf(context).height;
    return Positioned(
      top: myPosY + widget.position,
      left: myPosX + widget.position,
      width: myWidth,
      height: myHeight,
      child: GestureDetector(
        onDoubleTap: () {
          context.read<PageDraggable>().addWidget(const StickyNoteWidget(position: 0));
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
            }
            if (isResizing) {
              if ((myWidth >= 100 && myHeight >= 100) &&
                  (myWidth <= areaW && myHeight <= areaH) &&
                  (startPosition.dx <= areaW && startPosition.dy >= 0) &&
                  (startPosition.dy <= areaH && startPosition.dy >= 0)) {
                double dx = details.localPosition.dx - startPosition.dx;
                double dy = details.localPosition.dy - startPosition.dy;
                myWidth += dx;
                myHeight += dy;
                startPosition = details.localPosition;
              } else if (myHeight < 100) {
                myHeight = 100;
              } else if (myWidth < 100) {
                myWidth = 100;
              }
            }
          });
        },
        onPanEnd: (details) {
          setState(() {
            isResizing = false;
          });
        },
        child: Card(color: Colors.redAccent,
          elevation: 5,
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: TextField(
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
    );
  }
}
