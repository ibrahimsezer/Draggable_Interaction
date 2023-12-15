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
      width: 150,
      height: 150,
      color: Colors.white,
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          children:   [
            ActivityBarIcon(
              myHeight: defaultHeight,
              myWidth: defaultWidth,
              widgetButtonName: const StickyNoteWidget(
                  initialColor: Color.fromRGBO(190, 49, 68, 1)),
              widgetButtonIcon: Icons.sticky_note_2,
            ),
            ActivityBarIcon(
              myHeight: defaultHeight,
              myWidth: defaultWidth,
              widgetButtonName: const StarWidget(),
              widgetButtonIcon: Icons.star,
            ),
            ActivityBarIcon(
              myHeight: defaultHeight,
              myWidth: defaultWidth,
              widgetButtonName: const RightArrowWidget(),
              widgetButtonIcon: Icons.arrow_right_alt,
            ),
            ActivityBarIcon(
              myHeight: defaultHeight,
              myWidth: defaultWidth,
              widgetButtonName: const EllipseShapeWidget(),
              widgetButtonIcon: Icons.circle_outlined,
            ),
            ActivityBarIcon(
              myHeight: defaultHeight,
              myWidth: defaultWidth,
              widgetButtonName: const RectangleShapeWidget(),
              widgetButtonIcon: Icons.rectangle,
            ),
            ActivityBarIcon(
              myHeight: defaultHeight,
              myWidth: defaultWidth,
              widgetButtonName: const RoundedRectangleShapeWidget(),
              widgetButtonIcon: Icons.rounded_corner,
            ),
            ActivityBarIcon(
              myHeight: defaultHeight,
              myWidth: defaultWidth,
              widgetButtonName: const RhombusShapeWidget(),
              widgetButtonIcon: Icons.format_shapes,
            ),
            ActivityBarIcon(
              myHeight: defaultHeight,
              myWidth: defaultWidth,
              widgetButtonName: const CircleWidget(),
              widgetButtonIcon: Icons.circle,
            ),
            ActivityBarIcon(
                widgetButtonName: const TriangleShapeWidget(),
                widgetButtonIcon: Icons.play_arrow_rounded,
                myWidth: defaultHeight,
                myHeight: defaultWidth),
          ]),
    );
  }
}
