import 'package:flutter/material.dart';

class StickyNoteWidget extends StatefulWidget {
  final MaterialColor initialColor;

  const StickyNoteWidget({
    super.key,
    required this.initialColor,
  });

  @override
  State<StickyNoteWidget> createState() => _StickyNoteWidgetState();
}

class _StickyNoteWidgetState extends State<StickyNoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.initialColor,
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: TextField(
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          FocusScope.of(context).unfocus();
        },
        textAlign: TextAlign.center,
        maxLines: null,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        style: const TextStyle(
            color: Colors.black, fontSize: 20, decoration: TextDecoration.none),
      ),
    );
  }
}
