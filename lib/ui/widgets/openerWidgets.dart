import 'dart:developer';
import 'package:draggable_example/ui/widgets/reDragText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../pageDraggable.dart';

///Opener Widgets
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
