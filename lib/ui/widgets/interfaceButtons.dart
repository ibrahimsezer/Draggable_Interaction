import 'package:draggable_example/exmp/thisModel.dart';
import 'package:draggable_example/model/widgetModel.dart';
import 'package:draggable_example/ui/widgets/draggableWidget.dart';
import 'package:draggable_example/ui/widgets/listViewBuilder.dart';
import 'package:draggable_example/ui/widgets/moduler_widget.dart';
import 'package:draggable_example/ui/widgets/noteWidget.dart';
import 'package:draggable_example/ui/widgets/openerWidget.dart';
import 'package:draggable_example/ui/widgets/shape.dart';
import 'package:draggable_example/ui/widgets/stickyNoteWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../mainBoard.dart';

int idCounter = 0;

///Create Widget Button '+'
class CreateWidget extends StatefulWidget {
  const CreateWidget({super.key});

  @override
  State<CreateWidget> createState() => _CreateWidgetState();
}

class _CreateWidgetState extends State<CreateWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 30,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 35,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              ThisModel myModel = ThisModel(
                  id: idCounter,
                  widget: const ListViewWidget(),
                  isActive: false);
              context.read<WidgetFunctions>().addThisModel(myModel);
            },
            icon: const Icon(Icons.add)),
      ),
    );
  }
}

///Create Text Widget Button 'Tt'
class CreateTextWidget extends StatefulWidget {
  const CreateTextWidget({super.key});

  @override
  State<CreateTextWidget> createState() => _CreateTextWidgetState();
}

class _CreateTextWidgetState extends State<CreateTextWidget> {
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 110,
      right: 100,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 35,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                tempText = myController.text;
                myController.text = "";
                WidgetModel.idCount++;
              });
              ThisModel myModel = ThisModel(
                  id: idCounter,
                  widget: ModulerWidget(
                      widgetVariable: const RoundedRectangleShapeWidget(),
                      myPosY: 0,
                      myPosX: 0,
                      initialWidth: 100,
                      initialHeight: 100),
                  isActive: false);
              context.read<WidgetFunctions>().addThisModel(myModel);
            },
            icon: const Icon(Icons.text_fields)),
      ),
    );
  }
}

///Delete Button

class DeleteWidget extends StatefulWidget {
  const DeleteWidget({super.key});

  @override
  State<DeleteWidget> createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DeleteWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 30,
        left: 30,
        child: DragTarget(
          onAccept: (data) {
            context.read<MainBoard>().allRemoveWidget();
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
}

///Example Widget Button
class ExampleWidgetButton extends StatefulWidget {
  const ExampleWidgetButton({super.key});

  @override
  State<ExampleWidgetButton> createState() => _ExampleWidgetButtonState();
}

class _ExampleWidgetButtonState extends State<ExampleWidgetButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 30,
        right: 170,
        child: CircleAvatar(
          backgroundColor: Colors.amberAccent,
          radius: 35,
          child: IconButton(
              onPressed: () {
                ThisModel myModel = ThisModel(
                    id: idCounter,
                    widget: ModulerWidget(
                        initialHeight: 100,
                        initialWidth: 100,
                        myPosX: 0,
                        myPosY: 0,
                        widgetVariable: const RectangleShapeWidget()),
                    isActive: false);
                context.read<WidgetFunctions>().addThisModel(myModel);
              },
              color: Colors.black,
              icon: const Icon(Icons.pix)),
        ));
  }
}

///Resizeable Widget Button 'A->'
class ResizeableWidget extends StatefulWidget {
  const ResizeableWidget({super.key});

  @override
  State<ResizeableWidget> createState() => _ResizeableWidgetState();
}

class _ResizeableWidgetState extends State<ResizeableWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 110,
      right: 30,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 35,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              ThisModel myModel = ThisModel(
                  isActive: false,
                  id: idCounter,
                  widget: ModulerWidget(
                      myPosX: 0,
                      myPosY: 0,
                      initialHeight: 120,
                      initialWidth: 120,
                      widgetVariable: const NoteWidget()));
              context.read<WidgetFunctions>().addThisModel(myModel);
            },
            icon: const Icon(Icons.text_rotation_angledown)),
      ),
    );
  }
}

///StickyNote Widget Button
class StickyNoteWidgetButton extends StatefulWidget {
  const StickyNoteWidgetButton({super.key});

  @override
  State<StickyNoteWidgetButton> createState() => _StickyNoteWidgetButtonState();
}

class _StickyNoteWidgetButtonState extends State<StickyNoteWidgetButton> {
  double posX = 0;
  double posY = 0;

  @override
  Widget build(BuildContext context) {
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
                ThisModel myModel = ThisModel(
                    id: idCounter,
                    widget: ModulerWidget(
                        myPosX: 0,
                        myPosY: 0,
                        initialWidth: 100,
                        initialHeight: 100,
                        widgetVariable: const StickyNoteWidget(
                          initialColor: Colors.deepPurple,
                        )),
                    isActive: false);
                context.read<WidgetFunctions>().addThisModel(myModel);
              });
            },
            icon: const Icon(Icons.sticky_note_2_rounded)),
      ),
    );
  }
}

///Opener Widget Button
class OpenerWidgetButton extends StatefulWidget {
  const OpenerWidgetButton({super.key});

  @override
  State<OpenerWidgetButton> createState() => _OpenerWidgetButtonState();
}

class _OpenerWidgetButtonState extends State<OpenerWidgetButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 110,
      right: 170,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 35,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                ThisModel myModel = ThisModel(
                    id: idCounter,
                    widget: ModulerWidget(
                        myPosX: 0,
                        myPosY: 0,
                        initialWidth: 230,
                        initialHeight: 50,
                        widgetVariable: const OpenerTopWidget()),
                    isActive: false);
                context.read<WidgetFunctions>().addThisModel(myModel);
              });
            },
            icon: const Icon(Icons.open_in_new_rounded)),
      ),
    );
  }
}


///Ellipse Widget Button
class EllipseShapeWidgetButton extends StatefulWidget {
  const EllipseShapeWidgetButton({super.key});

  @override
  State<EllipseShapeWidgetButton> createState() => _EllipseShapeWidgetButtonState();
}

class _EllipseShapeWidgetButtonState extends State<EllipseShapeWidgetButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 250,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 25,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                ThisModel myModel = ThisModel(
                    id: idCounter,
                    widget: ModulerWidget(
                        myPosX: 0,
                        myPosY: 0,
                        initialWidth: 230,
                        initialHeight: 50,
                        widgetVariable: const EllipseShapeWidget()),
                    isActive: false);
                context.read<WidgetFunctions>().addThisModel(myModel);
              });
            },
            icon: const Icon(Icons.circle)),
      ),
    );
  }
}
