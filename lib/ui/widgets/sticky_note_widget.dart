import 'package:flutter/material.dart';

class StickyNoteWidget extends StatelessWidget {
  final Color initialColor;

  const StickyNoteWidget({
    super.key,
    required this.initialColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: initialColor,
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
