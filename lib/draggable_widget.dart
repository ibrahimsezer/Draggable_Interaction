import 'package:flutter/material.dart';

double globalPosX = 0;
double globalPosY = 0;
double posX = 0;
double posY = 0;
Key globalKey = const Key("");

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
            child: Container(height: areaH*0.2, width: areaW, color: Colors.red)),
        ...widgets,

        ///Create Widget
        createWidget,

        ///Create Text
        createTextWidget(context),

        ///Delete Button
        deleteWidget,
      ]),
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
                                    widgets.add(DraggableWidget2(
                                      getText: myController.text,
                                    ));
                                    myController.text = "";
                                  });
                                },
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Kaydet"),
                                    Icon(Icons.save)
                                  ],
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
    return Positioned(
      top: globalPosY + 50,
      left: globalPosX + 50,
      child: Draggable(
        onDragUpdate: (details) {
          setState(() {
            posX = details.globalPosition.dx - DragContainer.sizeW / 2;
            posY = details.globalPosition.dy - DragContainer.sizeH / 2;

            globalPosX = posX;
            globalPosY = posY;
          });
        },
        feedback: Text(
          widget.getText,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              decoration: TextDecoration.none),
        ),
        child: Text(
          widget.getText,
          style: const TextStyle(
              color: Colors.blue,
              fontSize: 20,
              decoration: TextDecoration.none),
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
  Key dragKey = Key("1a1a1a1a");

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
        feedback: DragContainer(
            brWidth: brWidth, brColor: brColor, textData: widget.txtData),
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
          print(posX.toString());
          print(posY.toString());
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
  DragContainer({
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
