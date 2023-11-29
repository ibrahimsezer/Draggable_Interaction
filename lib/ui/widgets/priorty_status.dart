import 'package:flutter/material.dart';

class PriorityStatus extends StatelessWidget {
  final String prioTitle;
  final Color selectedColor;

  PriorityStatus({
    super.key,
    required this.prioTitle,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(color: selectedColor),
          height: 100,
          width: 100,
          child: Column(
            children: [
              Text(prioTitle),
              TextField(
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
            ],
          )),
    );
  }
}

class PrioStatusWidget extends StatelessWidget {
  const PrioStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.blueGrey.shade100,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PriorityStatus(
                    prioTitle: "Ideas", selectedColor: Colors.lightBlue),
                PriorityStatus(
                    prioTitle: "In Progress",
                    selectedColor: Colors.orangeAccent),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PriorityStatus(
                    prioTitle: "Postponed",
                    selectedColor: Colors.redAccent),
                PriorityStatus(
                    prioTitle: "Completed", selectedColor: Colors.green),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DoubleContainer extends StatelessWidget {
  const DoubleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          width: 200,
          height: 200,
          child: Center(
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ],
    );
  }
}
