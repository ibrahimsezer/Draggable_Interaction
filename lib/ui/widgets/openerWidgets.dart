import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
            log("Copied.");
          },
        ),
        OpenerButton(
          barIcons: const Icon(Icons.delete),
          action: () {
            log("Deleted.");
          },
        ),
        OpenerButton(
          barIcons: const Icon(Icons.format_size),
          action: () {
            log("Tt Active");
          },
        ),
        OpenerButton(
          barIcons: const Icon(Icons.color_lens),
          action: () {
            log("Color Active");
            showDialog(
                builder: (context) => AlertDialog(
                      title: const Text('Pick a Color'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
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
    return InkWell(
      onTap: () {
        print("INKWELL");
      },
      child: Padding(
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
      ),
    );
  }
}
