import 'package:flutter/material.dart';

import '../../pageDraggable.dart';

class DraggableWidget extends StatefulWidget {
  DraggableWidget({
    Key? key,
    required this.txtData,
    required this.shouldRemove,
  }) : super(key: key ?? UniqueKey());

  final bool shouldRemove;
  final String txtData;

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  double brWidth = 0;
  Color brColor = Colors.black;
  double areaW1 = 0;
  double areaH1 = 0;
  double myPosX = 0;
  double myPosY = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: myPosY,
      left: myPosX,
      child: Draggable(
        feedback: const SizedBox(),
        onDragStarted: () {},
        onDragUpdate: (details) {
          setState(() {
            brColor = Colors.black;
            brWidth = 2;
            if (!isResizing) {
              myPosX += details.delta.dx;
              myPosY += details.delta.dy;
            }
          });
        },
        data: "myData",
        onDragEnd: (details) {
          setState(() {
            brColor = Colors.black;
            brWidth = 2;
          });
        },
        onDraggableCanceled: (v, o) {
          setState(() {
            brColor = Colors.black;
            brWidth = 1;
          });
        },
        child: DragContainer(
            brWidth: brWidth, brColor: brColor, textData: widget.txtData),
      ),
    );
  }
}

class DragContainer extends StatelessWidget {
  const DragContainer({
    super.key,
    required this.brWidth,
    required this.brColor,
    required this.textData,
  });

  final double brWidth;
  final Color brColor;
  final String textData;
  static const double sizeW = 150;
  static const double sizeH = 150;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(border: Border.all(width: brWidth, color: brColor)),
      width: sizeW,
      height: sizeH,
      child: Center(
          child: Text(
            textData,
            style: const TextStyle(
                color: Colors.black, fontSize: 15, decoration: TextDecoration.none),
          )),
    );
  }
}
