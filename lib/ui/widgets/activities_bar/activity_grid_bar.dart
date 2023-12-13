import 'package:draggable_example/ui/widgets/interface_buttons.dart';
import 'package:draggable_example/ui/widgets/shape.dart';
import 'package:draggable_example/ui/widgets/sticky_note_widget.dart';
import 'package:flutter/material.dart';

class ActivityGridBar extends StatelessWidget {
  const ActivityGridBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.white,
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          children: const [
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: StickyNoteWidget(
                  initialColor: Color.fromRGBO(190, 49, 68, 1)),
              widgetButtonIcon: Icons.sticky_note_2,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: StarWidget(),
              widgetButtonIcon: Icons.star,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: RightArrowWidget(),
              widgetButtonIcon: Icons.arrow_right_alt,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: EllipseShapeWidget(),
              widgetButtonIcon: Icons.circle_outlined,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: RectangleShapeWidget(),
              widgetButtonIcon: Icons.rectangle,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: RoundedRectangleShapeWidget(),
              widgetButtonIcon: Icons.rounded_corner,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: RhombusShapeWidget(),
              widgetButtonIcon: Icons.format_shapes,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: CircleWidget(),
              widgetButtonIcon: Icons.circle,
            ),
            ActivityBarIcon(
                widgetButtonName: TriangleShapeWidget(),
                widgetButtonIcon: Icons.play_arrow_rounded,
                myWidth: 100,
                myHeight: 100),
          ]),
    );
  }
}
