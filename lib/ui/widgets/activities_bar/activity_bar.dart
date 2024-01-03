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
  bool noneWidget = true;
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
          //todo change Activity Bar, must be without widget create.
          //todo make activityBarIcon activated with another button.
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.near_me,
              activityBarWidth: posZero,
              activityBarHeight: posZero),
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
            activityBarWidth: 110,
            activityBarHeight: 110,
          ),
          if(noneWidget)
          ActivityBarIcon(
              widgetButtonName:
                   ActivityGridBar(),
              widgetButtonIcon: Icons.window_outlined,
              activityBarWidth: posZero,
              activityBarHeight: posZero),
          if(noneWidget)
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.widgets_outlined,
              activityBarWidth: posZero,
              activityBarHeight: posZero),
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.undo,
              activityBarWidth: posZero,
              activityBarHeight: posZero),
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.redo,
              activityBarWidth: posZero,
              activityBarHeight: posZero),
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.delete,
              activityBarWidth: posZero,
              activityBarHeight: posZero),
        ],
      ),
    );
  }
}
