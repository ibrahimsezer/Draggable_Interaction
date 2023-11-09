import 'dart:developer';
import 'package:flutter/material.dart';
import '../mainBoard.dart';
import 'openerWidget.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({
    super.key,
  });

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

//Create Text Widget with Resizeable
class _NoteWidgetState extends State<NoteWidget> {
  bool isVisible = false;
  TextEditingController txtController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(left: containerLeft, top: containerTop),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.orangeAccent,
                    child: TextField(
                      onChanged: (value) {
                        log(txtController.text);
                        log("tempText : $tempText");
                        tempText = txtController.text;
                      },
                      controller: txtController,
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
                          color: Colors.black,
                          fontSize: 20,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child:
                Visibility(visible: isVisible, child: const OpenerTopWidget()),
          ),
        ],
      ),
    );
  }
}
