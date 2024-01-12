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
          const ActivityBarIcon(
            widgetButtonName: SizedBox(),
            widgetButtonIcon: Icons.near_me,
          ),
          const ActivityBarIcon(
            widgetButtonName: EnterTextField(),
            widgetButtonIcon: Icons.title,
          ),
          if (noneWidget)
            const ActivityBarIcon(
              widgetButtonName: SizedBox(),
              widgetButtonIcon: Icons.window_outlined,
            ),
          if (noneWidget)
            const ActivityBarIcon(
              widgetButtonName: SizedBox(),
              widgetButtonIcon: Icons.widgets_outlined,
            ),
          const ActivityBarIcon(
            widgetButtonName: SizedBox(),
            widgetButtonIcon: Icons.undo,
          ),
          const ActivityBarIcon(
            widgetButtonName: SizedBox(),
            widgetButtonIcon: Icons.redo,
          ),
          const ActivityBarIcon(
            widgetButtonName: SizedBox(),
            widgetButtonIcon: Icons.delete,
          ),
        ],
      ),
    );
  }
}
