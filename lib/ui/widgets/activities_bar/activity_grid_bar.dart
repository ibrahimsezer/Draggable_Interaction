import 'package:draggable_example/ui/widgets/interface_buttons.dart';
import 'package:draggable_example/ui/widgets/shape.dart';
import 'package:draggable_example/ui/widgets/sticky_note_widget.dart';
import 'package:flutter/material.dart';

class ActivityGridBar extends StatelessWidget {
  ActivityGridBar({super.key});

  double defaultHeight = 100;
  double defaultWidth = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 150,
      height: 150,
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          children: [
            ActivityBarIcon(
              activityBarHeight: defaultHeight,
              activityBarWidth: defaultWidth,
              widgetButtonName: const StickyNoteWidget(
                  initialColor: Color.fromRGBO(190, 49, 68, 1)),
              widgetButtonIcon: Icons.sticky_note_2,
            ),
            ActivityBarIcon(
              activityBarHeight: defaultHeight,
              activityBarWidth: defaultWidth,
              widgetButtonName: const StarWidget(),
              widgetButtonIcon: Icons.star,
            ),
            ActivityBarIcon(
              activityBarHeight: defaultHeight,
              activityBarWidth: defaultWidth,
              widgetButtonName: const RightArrowWidget(),
              widgetButtonIcon: Icons.arrow_right_alt,
            ),
            ActivityBarIcon(
              activityBarHeight: defaultHeight,
              activityBarWidth: defaultWidth,
              widgetButtonName: const EllipseShapeWidget(),
              widgetButtonIcon: Icons.circle_outlined,
            ),
            ActivityBarIcon(
              activityBarHeight: defaultHeight,
              activityBarWidth: defaultWidth,
              widgetButtonName: const RectangleShapeWidget(),
              widgetButtonIcon: Icons.rectangle,
            ),
            ActivityBarIcon(
              activityBarHeight: defaultHeight,
              activityBarWidth: defaultWidth,
              widgetButtonName: const RoundedRectangleShapeWidget(),
              widgetButtonIcon: Icons.rounded_corner,
            ),
            ActivityBarIcon(
              activityBarHeight: defaultHeight,
              activityBarWidth: defaultWidth,
              widgetButtonName: const RhombusShapeWidget(),
              widgetButtonIcon: Icons.format_shapes,
            ),
            ActivityBarIcon(
              activityBarHeight: defaultHeight,
              activityBarWidth: defaultWidth,
              widgetButtonName: const CircleWidget(),
              widgetButtonIcon: Icons.circle,
            ),
            ActivityBarIcon(
                widgetButtonName: const TriangleShapeWidget(),
                widgetButtonIcon: Icons.play_arrow_rounded,
                activityBarWidth: defaultWidth,
                activityBarHeight: defaultHeight),
            ActivityBarIcon(
                widgetButtonName: const TriangleRPS(),
                widgetButtonIcon: Icons.play_arrow_outlined,
                activityBarWidth: defaultWidth,
                activityBarHeight: defaultHeight),
          ]),
    );
  }
}