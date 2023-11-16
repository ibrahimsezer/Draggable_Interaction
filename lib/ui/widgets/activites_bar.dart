import 'package:draggable_example/ui/widgets/moduler_widget.dart';
import 'package:draggable_example/ui/widgets/shape.dart';
import 'package:draggable_example/ui/widgets/sticky_note_widget.dart';
import 'package:flutter/material.dart';

import 'image_widget.dart';
import 'interface_buttons.dart';
import 'note_widget.dart';
import 'opener_widget.dart';

class ActivityBar extends StatelessWidget {
  const ActivityBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 500,
      color: Colors.white,
      child: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        children: const [
          ActivityBarIcon(
              widgetButtonName: TriangleShapeWidget(),
              widgetButtonIcon: Icons.play_arrow_rounded,
              myWidth: 100,
              myHeight: 100),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/sqldeveloper.svg'),
            widgetButtonIcon: Icons.save,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/outline-cloud.svg'),
            widgetButtonIcon: Icons.cloud,
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
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: NoteWidget(),
            widgetButtonIcon: Icons.note,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName:
                StickyNoteWidget(initialColor: Color.fromRGBO(190, 49, 68, 1)),
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
        ],
      ),
    );
  }
}
