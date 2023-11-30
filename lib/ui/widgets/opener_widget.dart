import 'dart:developer';
import 'package:draggable_example/model/widget_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_widget.dart';

///Opener Widgets
class OpenerTopWidget extends StatefulWidget {
  const OpenerTopWidget({
    super.key,
  });

  final double myWidth = 230;
  final double myHeight = 50;

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
      width: widget.myWidth,
      height: widget.myHeight,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromRGBO(34, 9, 44, 1)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        OpenerButton(
          barIcons: const Icon(Icons.copy),
          action: () {
            // context.read<PageDraggable>().addWidget(NoteWidget(
            //   getText: tempText,
            // ));
            context.read<WidgetFunctions>().addItem(WidgetModel(
                myId: WidgetModel.widgetModelList.length,
                widget: const NoteWidget(),
                isSelected: true));
            WidgetModel.idCount++;
            log("${WidgetModel.widgetModelList.toList()}");
            log("${WidgetModel.widgetModelList.length}");
            log("${WidgetModel.idCount}");
          },
        ),
        OpenerButton(
          barIcons: const Icon(Icons.delete),
          action: () {
            setState(() {});
          },
        ),
        OpenerButton(
          barIcons: const Icon(Icons.format_size),
          action: () {},
        ),
        OpenerButton(
          barIcons: const Icon(Icons.color_lens),
          action: () {},
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
          widget.action.call();
        },
        child: CircleAvatar(
          foregroundColor: Colors.black,
          radius: 20,
          backgroundColor: Colors.amberAccent,
          child: widget.barIcons,
        ),
      ),
    );
  }
}
