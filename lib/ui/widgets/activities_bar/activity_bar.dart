import 'package:draggable_example/ui/widgets/activities_bar/activity_grid_bar.dart';
import 'package:draggable_example/ui/widgets/activities_bar/activity_grid_svg_bar.dart';
import 'package:draggable_example/ui/widgets/enter_textfield.dart';
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
    return SizedBox(
      width: 50,
      height: 400,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        children: [
          //todo change Activity Bar, must be without widget create.
          //todo make activityBarIcon activated with another button.
          ActivityBarIcon(
              widgetButtonName: const SizedBox(),
              widgetButtonIcon: Icons.near_me,
              activityBarWidth: posZero,
              activityBarHeight: posZero),
          const ActivityBarIcon(
            widgetButtonName: EnterTextField(),
            widgetButtonIcon: Icons.title,
            activityBarWidth: 100,
            activityBarHeight: 100,
          ),
          if (noneWidget)
            ActivityBarIcon(
                widgetButtonName: ActivityGridBar(),
                widgetButtonIcon: Icons.window_outlined,
                activityBarWidth: posZero,
                activityBarHeight: posZero),
          if (noneWidget)
            ActivityBarIcon(
                widgetButtonName: ActivityGridSvgBar(),
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
