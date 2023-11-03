import 'dart:developer';
import 'package:draggable_example/model/example.dart';
import 'package:draggable_example/model/widgetModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../mainBoard.dart';
import 'noteWidget.dart';

///Opener Widgets
class OpenerTopWidget extends StatefulWidget {
  const OpenerTopWidget({
    super.key,
  });

  @override
  State<OpenerTopWidget> createState() => _OpenerTopWidgetState();
}

class _OpenerTopWidgetState extends State<OpenerTopWidget> {
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 50,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.black87),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        OpenerButton(
          barIcons: const Icon(Icons.copy),
          action: () {
            // context.read<PageDraggable>().addWidget(NoteWidget(
            //   getText: tempText,
            // ));
            context.read<WidgetFunctions>().addItem(WidgetModel(
                myId: WidgetModel.widgetModelList.length,
                widget: NoteWidget(
                  getText: tempText,
                ),
                isSelected: true));
            WidgetModel.idCount++;
            print("copyy.");
            log("${WidgetModel.widgetModelList.toList()}");
            log("${WidgetModel.widgetModelList.length}");
            log("${WidgetModel.idCount}");
          },
        ),
        OpenerButton(
          barIcons: const Icon(Icons.delete),
          action: () {
            setState(() {
              WidgetFunctions().deleteSelectedWidget();
            });
          },
        ),
        OpenerButton(
          barIcons: const Icon(Icons.format_size),
          action: () {
            print("Tt Active");
          },
        ),
        OpenerButton(
          barIcons: const Icon(Icons.color_lens),
          action: () {
            print("Color Active");
            showDialog(
                builder: (context) => AlertDialog(
                      title: const Text('Pick a Color'),
                      content: SingleChildScrollView(
                        child: MaterialPicker(
                          pickerColor: pickerColor,
                          onColorChanged: changeColor,
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Got it'),
                          onPressed: () {
                            setState(() => currentColor = pickerColor);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                context: context);
          },
        ),
      ]),
    );
  }
}

class OpenerButton extends StatefulWidget {
  final Icon barIcons;
  final VoidCallback action;

  const OpenerButton({
    super.key,
    required this.barIcons,
    required this.action,
  });

  @override
  State<OpenerButton> createState() => _OpenerButtonState();
}

class _OpenerButtonState extends State<OpenerButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          print("action");
          widget.action.call();
        },
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.amberAccent,
          child: widget.barIcons,
        ),
      ),
    );
  }
}
