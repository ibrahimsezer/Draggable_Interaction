import 'package:flutter/material.dart';

class EnterTextField extends StatefulWidget {
  const EnterTextField({
    super.key,
  });

  @override
  State<EnterTextField> createState() => _EnterTextFieldState();
}

class _EnterTextFieldState extends State<EnterTextField> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: TextField(
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          FocusScope.of(context).unfocus();
        },
        textAlign: TextAlign.center,
        maxLines: null,
        decoration: const InputDecoration(
          hintText: "Enter Text",
          border: InputBorder.none,
        ),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
