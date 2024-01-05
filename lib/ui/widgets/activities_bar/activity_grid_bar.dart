import 'package:draggable_example/ui/widgets/interface_buttons.dart';
import 'package:draggable_example/ui/widgets/shape.dart';
import 'package:draggable_example/ui/widgets/sticky_note_widget.dart';
import 'package:flutter/material.dart';

class ActivityGridBar extends StatelessWidget {
  ActivityGridBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 150,
      height: 150,
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          children: const [
            ActivityBarIcon(
              widgetButtonName: StickyNoteWidget(
                  initialColor: Color.fromRGBO(190, 49, 68, 1)),
              widgetButtonIcon: Icons.sticky_note_2,
            ),
            ActivityBarIcon(
              widgetButtonName: StarWidget(),
              widgetButtonIcon: Icons.star,
            ),
            ActivityBarIcon(
              widgetButtonName: RightArrowWidget(),
              widgetButtonIcon: Icons.arrow_right_alt,
            ),
            ActivityBarIcon(
              widgetButtonName: EllipseShapeWidget(),
              widgetButtonIcon: Icons.circle_outlined,
            ),
            ActivityBarIcon(
              widgetButtonName: RectangleShapeWidget(),
              widgetButtonIcon: Icons.rectangle,
            ),
            ActivityBarIcon(
              widgetButtonName: RoundedRectangleShapeWidget(),
              widgetButtonIcon: Icons.rounded_corner,
            ),
            ActivityBarIcon(
              widgetButtonName: RhombusShapeWidget(),
              widgetButtonIcon: Icons.format_shapes,
            ),
            ActivityBarIcon(
              widgetButtonName: CircleWidget(),
              widgetButtonIcon: Icons.circle,
            ),
            ActivityBarIcon(
              widgetButtonName: TriangleShapeWidget(),
              widgetButtonIcon: Icons.play_arrow_rounded,
            ),
          ]),
    );
  }
}
