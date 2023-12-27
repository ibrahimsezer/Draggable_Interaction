import 'package:draggable_example/ui/widgets/activities_bar/activity_grid_bar.dart';
import 'package:flutter/material.dart';
import '../interface_buttons.dart';

class ActivityBar extends StatefulWidget {
  const ActivityBar({super.key});

  @override
  State<ActivityBar> createState() => _ActivityBarState();
}

class _ActivityBarState extends State<ActivityBar> {
  bool activeWidgets = false;
  double posZero = 0;
  List gridView = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 310,
      color: Colors.white,
      child: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        children: [
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.near_me,
              myWidth: posZero,
              myHeight: posZero),
          ActivityBarIcon(
            widgetButtonName: TextField(
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
            widgetButtonIcon: Icons.title,
            myWidth: 110,
            myHeight: 110,
          ),
          ActivityBarIcon(
              widgetButtonName:
                  activeWidgets ? ActivityGridBar() : const SizedBox(),
              widgetButtonIcon: Icons.window_outlined,
              myWidth: posZero,
              myHeight: posZero),
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.widgets_outlined,
              myWidth: posZero,
              myHeight: posZero),
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.undo,
              myWidth: posZero,
              myHeight: posZero),
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.redo,
              myWidth: posZero,
              myHeight: posZero),
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.delete,
              myWidth: posZero,
              myHeight: posZero),
        ],
      ),
    );
  }
}
