import 'package:draggable_example/ui/widgets/prioritizationTableWidget.dart';
import 'package:draggable_example/ui/widgets/reDragText.dart';
import 'package:draggable_example/ui/widgets/resizableWidgets.dart';
import 'package:draggable_example/ui/widgets/stickyNoteWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pageDraggable.dart';
import 'draggableWidgets.dart';

///Create Widget Button '+'
class CreateWidget extends StatefulWidget {
  const CreateWidget({super.key});

  @override
  State<CreateWidget> createState() => _CreateWidgetState();
}

class _CreateWidgetState extends State<CreateWidget> {
  int count = 0;

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
              context.read<PageDraggable>().addWidget(DraggableWidget(
                    txtData: "Widget: $count",
                    shouldRemove: false,
                  ));
              setState(() {
                count++;
              });
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
      bottom: 30,
      right: 100,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 35,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                tempText = myController.text;
                context.read<PageDraggable>().addWidget(ReDragText(
                      getText: myController.text,
                    ));
                myController.text = "";
              });
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
            context.read<PageDraggable>().allRemoveWidget();
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
        left: 60,
        child: CircleAvatar(
          backgroundColor: Colors.amberAccent,
          radius: 35,
          child: IconButton(
              onPressed: () {
                context
                    .read<PageDraggable>()
                    .addWidget(const PrioritizationTableWidget());
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
      bottom: 105,
      right: 30,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 35,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              context
                  .read<PageDraggable>()
                  .addWidget(const ResizeableTextWidget());
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
      bottom: 60,
      right: 100,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 35,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                for (int i = 0; i < 3; i++) {
                  context
                      .read<PageDraggable>()
                      .addWidget(const StickyNoteWidget());
                }
              });
            },
            icon: const Icon(Icons.sticky_note_2_rounded)),
      ),
    );
  }
}
