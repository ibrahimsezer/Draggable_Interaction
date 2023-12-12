import 'package:flutter/material.dart';

class PriorityStatus extends StatelessWidget {
  final String priorityTitle;
  final Color selectedColor;

  const PriorityStatus({
    super.key,
    required this.priorityTitle,
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
              Text(priorityTitle),
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
  PrioStatusWidget({super.key});

  final List<String> priorityString = [
    "Ideas",
    "In Progress",
    "Postponed",
    "Completed"
  ];

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
                    priorityTitle: priorityString[0],
                    selectedColor: Colors.lightBlue),
                PriorityStatus(
                    priorityTitle: priorityString[1],
                    selectedColor: Colors.orangeAccent),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PriorityStatus(
                    priorityTitle: priorityString[2],
                    selectedColor: Colors.redAccent),
                PriorityStatus(
                    priorityTitle: priorityString[3], selectedColor: Colors.green),
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
