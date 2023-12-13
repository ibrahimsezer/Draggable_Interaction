import 'package:draggable_example/ui/widgets/activities_bar/activity_grid_bar.dart';
import 'package:flutter/material.dart';
import '../interface_buttons.dart';

class ActivityBar extends StatefulWidget {
  ActivityBar({super.key});

  @override
  State<ActivityBar> createState() => _ActivityBarState();
}

class _ActivityBarState extends State<ActivityBar> {
  bool activeWidgets = false;

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
          const ActivityBarIcon(
              widgetButtonName: SizedBox(),
              widgetButtonIcon: Icons.near_me,
              myWidth: 0,
              myHeight: 0),
          ActivityBarIcon(
              widgetButtonName: SizedBox(
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
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.none),
                ),
              ),
              widgetButtonIcon: Icons.title,
              myWidth: 20,
              myHeight: 20),
          ActivityBarIcon(
              widgetButtonName:
                  activeWidgets ? const ActivityGridBar() : const SizedBox(),
              widgetButtonIcon: Icons.check_box_outline_blank,
              myWidth: 0,
              myHeight: 0),
          const ActivityBarIcon(
              widgetButtonName: SizedBox(),
              widgetButtonIcon: Icons.insert_emoticon,
              myWidth: 0,
              myHeight: 0),
          const ActivityBarIcon(
              widgetButtonName: SizedBox(),
              widgetButtonIcon: Icons.undo,
              myWidth: 0,
              myHeight: 0),
          const ActivityBarIcon(
              widgetButtonName: SizedBox(),
              widgetButtonIcon: Icons.redo,
              myWidth: 0,
              myHeight: 0),
        ],
      ),
    );
  }
}
