import 'dart:math';

import 'package:flutter/material.dart';

double globalPosX = 0;
double globalPosY = 0;
double posX = 0;
double posY = 0;
Key globalKey = const Key("");

double containerWidth = 150; // Başlangıç genişliği
double containerHeight = 150; // Başlangıç yüksekliği
double containerLeft = 0; // X pozisyonu
double containerTop = 0; // Y pozisyonu
bool isResizing = false;
Offset startPosition = Offset.zero;

class PageDraggable extends StatefulWidget {
  const PageDraggable({super.key});

  @override
  State<PageDraggable> createState() => _PageDraggableState();
}

class _PageDraggableState extends State<PageDraggable> {
  List<Widget> widgets = [];
  int count = 0;
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double areaW = MediaQuery.sizeOf(context).width;
    double areaH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0,
            child: Container(
                height: areaH * 0.1, width: areaW, color: Colors.red)),
        ...widgets,

        ///Create Widget Button
        createWidget,

        ///Create Text Button
        createTextWidget(context),

        ///Delete Button
        deleteWidget,
        resizeableWidget(context)

        ///Resizeable Widget
      ]),
    );
  }

  Positioned resizeableWidget(BuildContext context) {
    double areaW = MediaQuery.sizeOf(context).width;
    double areaH = MediaQuery.sizeOf(context).height;
    String resizeableText = "";
    return Positioned(
      top: 150,
      right: 150,
      child: GestureDetector(
        onPanStart: (details) {
          if (details.localPosition.dx >= containerWidth - 20 &&
              details.localPosition.dy >= containerHeight - 20) {
            setState(() {
              resizeableText = "onPanStart !!!";
              isResizing = true;
              startPosition = details.localPosition;
            });
          }
        },
        onPanUpdate: (details) {
          if (isResizing) {
            setState(() {
              if ((containerWidth >= 50 && containerHeight >= 50) &&
                  (containerWidth <= (areaW - 10) &&
                      containerHeight <= (areaH - 10)) &&
                  (startPosition.dx <= areaW && startPosition.dx >= 0) &&
                  (startPosition.dy <= areaH && startPosition.dy >= 0)) {
                resizeableText = "Update!!";
                double dx = details.localPosition.dx - startPosition.dx;
                double dy = details.localPosition.dy - startPosition.dy;
                containerWidth += dx;
                containerHeight += dy;
                startPosition = details.localPosition;
              } else if (containerHeight <= 50) {
                containerHeight = 51;
              } else if (containerWidth <= 50) {
                containerWidth = 50;
              } else {
                containerHeight = 51;
                containerWidth = 51;
              }
            });
          }
        },
        onPanEnd: (details) {
          setState(() {
            resizeableText = "Enddd !!";
            isResizing = false;
          });
        },
        child: Container(
          width: containerWidth,
          height: containerHeight,
          margin: EdgeInsets.only(left: containerLeft, top: containerTop),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: const Center(
            child: Text(
              textWidthBasis: TextWidthBasis.parent,
              textScaleFactor: 1,
              "Deneme123123123123123Deneme",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
      ),
    );
  }

  Positioned get deleteWidget {
    return Positioned(
        bottom: 30,
        left: 30,
        child: DragTarget(
          onAccept: (data) {
            setState(() {
              //Todo Silinecek eleman düzenlenmeli
              print(data.toString());
              print(widgets[0].key.toString());
              widgets.remove(widgets.first);
            });
          },
          builder: (BuildContext context, List<Object?> candidateData,
              List<dynamic> rejectedData) {
            return CircleAvatar(
              backgroundColor: Colors.amberAccent,
              radius: 35,
              child: IconButton(
                  onPressed: () {},
                  color: Colors.black,
                  icon: const Icon(Icons.delete)),
            );
          },
        ));
  }

  Positioned createTextWidget(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 100,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 35,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Açıklama girin"),
                        content: TextField(
                          controller: myController,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pop();
                                  widgets.add(ReDragText(
                                    getText: myController.text,
                                  ));
                                  myController.text = "";

                                  // widgets.add(DraggableWidget2(
                                  //   getText: myController.text,
                                  // ));
                                  // myController.text = "";
                                });
                              },
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [Text("Kaydet"), Icon(Icons.save)],
                              ))
                        ],
                      );
                    });
                globalPosY = 0;
                globalPosX = 0;
              });
            },
            icon: const Icon(Icons.text_fields)),
      ),
    );
  }

  Positioned get createWidget {
    return Positioned(
      bottom: 30,
      right: 30,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 35,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                globalPosY = 0;
                globalPosX = 0;
                widgets.add(DraggableWidget(
                  txtData: "Wid: $count",
                  shouldRemove: false,
                ));
                count++;
              });
            },
            icon: const Icon(Icons.add)),
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
  @override
  Widget build(BuildContext context) {
    late double localTextW;
    late double localTextH;
    return Positioned(
      top: globalPosY,
      left: globalPosX,
      child: Draggable(
          data: "myDatatext",
          onDragUpdate: (details) {
            setState(() {
              posX = details.globalPosition.dx - (localTextW / 2);
              posY = details.globalPosition.dy - (localTextH / 2);

              globalPosX = posX;
              globalPosY = posY;
            });
          },
          feedback: const SizedBox(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double textBorderW = 100;
              double textBorderH = 100;
              localTextH = textBorderH;
              localTextW = textBorderW;
              return Container(
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
              );
            },
          )),
    );
  }
}

class ReDragText extends StatefulWidget {
  const ReDragText({super.key, required this.getText});

  final String getText;

  @override
  State<ReDragText> createState() => _ReDragTextState();
}

class _ReDragTextState extends State<ReDragText> {
  @override
  Widget build(BuildContext context) {
    late double localTextW;
    late double localTextH;
    double areaW = MediaQuery.sizeOf(context).width;
    double areaH = MediaQuery.sizeOf(context).height;
    String resizeableText = "";

    return Positioned(
      top: globalPosY,
      right: globalPosX,
      child: Draggable(
        data: "myDatatext",
        onDragUpdate: (details) {
              setState(() {posX = details.globalPosition.dx - (localTextW*3.5);
              posY = details.globalPosition.dy - (localTextH / 2);

              globalPosX = -posX;
              globalPosY = posY;

              });
            },
        feedback: const SizedBox(),
        child: GestureDetector(
          onPanStart: (details) {
              if (details.localPosition.dx >= containerWidth - 20 &&
                  details.localPosition.dy >= containerHeight - 20) {
                setState(() {
                  resizeableText = "onPanStart !!!";
                  isResizing = true;
                  startPosition = details.localPosition;
                });
              }
            },
          onPanUpdate: (details) {
              if (isResizing) {
                setState(() {
                  if ((containerWidth >= 50 && containerHeight >= 50) &&
                      (containerWidth <= (areaW - 10) &&
                          containerHeight <= (areaH - 10)) &&
                      (startPosition.dx <= areaW && startPosition.dx >= 0) &&
                      (startPosition.dy <= areaH && startPosition.dy >= 0)) {
                    resizeableText = "Update!!";
                    double dx = details.localPosition.dx - startPosition.dx;
                    double dy = details.localPosition.dy - startPosition.dy;
                    containerWidth += dx;
                    containerHeight += dy;
                    startPosition = details.localPosition;
                  } else if (containerHeight <= 50) {
                    containerHeight = 51;
                  } else if (containerWidth <= 50) {
                    containerWidth = 51;
                  } else {
                    containerHeight = 51;
                    containerWidth = 51;
                  }
                });
              }
            },
          onPanEnd: (details) {
              setState(() {
                resizeableText = "Enddd !!";
                isResizing = false;
              });
            },
          child: LayoutBuilder(
                builder: (context, constraints) {
                  double textBorderW = 100;
                  double textBorderH = 100;
                  localTextH = textBorderH;
                  localTextW = textBorderW;
                  return Container(
                    width: containerWidth,
                    height: containerHeight,
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
                  );
                },
              ),
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

  // double  posX = (areaW / 2) - (DragContainer.sizeW / 2);
  // double posY = (areaH / 2) - (DragContainer.sizeH / 2);

  @override
  void initState() {
    super.initState();
    globalKey = dragKey;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: globalPosY,
      left: globalPosX,
      child: Draggable(
        feedback: const SizedBox(),
        onDragStarted: () {},
        onDragUpdate: (details) {
          setState(() {
            brColor = Colors.black;
            brWidth = 2;
            posX = details.globalPosition.dx - DragContainer.sizeW / 2;
            posY = details.globalPosition.dy - DragContainer.sizeH / 2;

            globalPosX = posX;
            globalPosY = posY;
          });
        },
        data: globalKey,
        onDragEnd: (details) {
          log(posX);
          log(posY);
          setState(() {
            brColor = Colors.black;
            brWidth = 2;
          });
        },
        onDraggableCanceled: (v, o) {
          setState(() {
            brColor = Colors.black;
            brWidth = 2;
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
