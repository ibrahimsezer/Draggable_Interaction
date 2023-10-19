import 'dart:developer';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'interfaceButtons.dart';

double globalPosX = 0;
double globalPosY = 0;
double containerLeft = 0;
double containerTop = 0;
bool isResizing = false;
Offset startPosition = Offset.zero;
String tempText = "";

class PageDraggable extends StatefulWidget with ChangeNotifier {
  PageDraggable({super.key});

  static List<Widget> widgets = [];

  void addWidget(Widget widget) {
    PageDraggable.widgets.add(widget);
    notifyListeners();
    print("${widgets.toList()}");
  }

  void removeWidget(Widget widget) {
    PageDraggable.widgets.remove(widget);
    notifyListeners();
  }

  @override
  State<PageDraggable> createState() => _PageDraggableState();
}

class _PageDraggableState extends State<PageDraggable> with ChangeNotifier {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          Consumer<PageDraggable>(
            builder: (context, value, child) {
              return Positioned(
                  top: 5,
                  left: 300,
                  child: Text("x: $globalPosX | y: $globalPosY "));
            },
          ),
          Consumer<PageDraggable>(
            builder: (context, value, child) {
              return Stack(
                children: [...PageDraggable.widgets],
              );
            },
          ),

          ///Create Widget Button
          const CreateWidget(),

          ///Create Text Widget Button
          const CreateTextWidget(),

          ///Delete Button
          const DeleteWidget(),

          ///Resizeable Widget Button
          const ResizeableWidget(),
        ]),
      ),
    );
  }
}

class OpenerTopWidget extends StatefulWidget {
  OpenerTopWidget({
    super.key,
  });

  @override
  State<OpenerTopWidget> createState() => _OpenerTopWidgetState();
}

class _OpenerTopWidgetState extends State<OpenerTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 50,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.black87),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        OpenerButton(
          barIcons: const Icon(Icons.copy),
          action: () {
            log("+++++++111");
            context.read<PageDraggable>().addWidget(ReDragText(
                  key: UniqueKey(),
                  getText: tempText,
                ));
          },
        ),
        OpenerButton(
          barIcons: const Icon(Icons.delete),
          action: () {
            context
                .read<PageDraggable>()
                .removeWidget(ReDragText(getText: tempText));
          },
        ),
        OpenerButton(
          barIcons: const Icon(Icons.format_size),
          action: () {},
        ),
      ]),
    );
  }
}

class OpenerButton extends StatelessWidget {
  final Icon barIcons;
  final VoidCallback action;

  const OpenerButton({
    super.key,
    required this.barIcons,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.amberAccent,
          child: IconButton(
            iconSize: 20,
            splashRadius: 25,
            onPressed: () => action,
            icon: barIcons,
            color: Colors.black,
          )),
    );
  }
}

class MyModel {
  const MyModel(
    this.posX,
    this.posY,
    this.text,
    this.width,
    this.height,
    this.key,
  );

  final double posX;
  final double posY;
  final String text;
  final double width;
  final double height;
  final Key key;

  double get getPosX => posX;

  double get getPosY => posY;

  double get getWidth => width;

  double get getHeight => height;

  String get gettext => text;

  Key get getKey => key;

  Key getMyKey() => key;
}

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
      //topwidget
      top: myPosY,
      left: myPosX,
      width: 170,
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
        onTap: () {
          log("+++++++");
          print("width : $myWidth | "
              "\nheight : $myHeight | "
              "\nStartPosition : $startPosition");
        },
        onPanEnd: (details) {
          setState(() {
            isResizing = false;
          });
        },
        child: OpenerTopWidget(),
      ),
    );
  }
}

class DraggableWidget2 extends StatefulWidget {
  final String getText;

  const DraggableWidget2({
    super.key,
    required this.getText,
  });

  @override
  State<DraggableWidget2> createState() => _DraggableWidget2State();
}

class _DraggableWidget2State extends State<DraggableWidget2> {
  double myPosX = 0;
  double myPosY = 0;

  @override
  Widget build(BuildContext context) {
    double textBorderW = 100;
    double textBorderH = 100;

    return Positioned(
      top: myPosY,
      left: myPosX,
      child: Draggable(
          data: "myDatatext",
          onDragUpdate: (details) {
            setState(() {
              if (!isResizing) {
                myPosX += details.delta.dx;
                myPosY += details.delta.dy;
              }
            });
          },
          feedback: const SizedBox(),
          child: Container(
            width: textBorderW,
            height: textBorderH,
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Text(
              textWidthBasis: TextWidthBasis.parent,
              textScaleFactor: 1,
              widget.getText,
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  decoration: TextDecoration.none),
            ),
          )),
    );
  }
}

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
            //todo topWidget_visible = true;
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
  Key dragKey = const Key("1a1a1a1a");
  double myPosX = 0;
  double myPosY = 0;

  // double  posX = (areaW / 2) - (DragContainer.sizeW / 2);
  // double posY = (areaH / 2) - (DragContainer.sizeH / 2);

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
