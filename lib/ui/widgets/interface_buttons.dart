import 'package:draggable_example/model/this_model.dart';
import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/ui/widgets/moduler_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

int idCounter = 0;
bool widgetBarActiveGrid = false;
bool widgetBarActiveSvg = false;

///-------------------------Activity_Bar--------------------------------
class ActivityBarIcon extends StatefulWidget {
  const ActivityBarIcon({
    super.key,
    required this.widgetButtonName,
    required this.widgetButtonIcon,
    required this.myWidth,
    required this.myHeight,
  });

  final Widget widgetButtonName;
  final IconData widgetButtonIcon;
  final double myWidth;
  final double myHeight;

  @override
  State<ActivityBarIcon> createState() => _ActivityBarIconState();
}

class _ActivityBarIconState extends State<ActivityBarIcon> {
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          ThisModel myModel = ThisModel(
              id: idCounter,
              widget: ModulerWidget(
                myPosX: MediaQuery.sizeOf(context).width * 0.4,
                myPosY: MediaQuery.sizeOf(context).height * 0.4,
                initialWidth: widget.myWidth,
                initialHeight: widget.myHeight,
                widgetVariable: widget.widgetButtonName,
                id: idCounter++,
              ),
              isActive: false);
          if (widget.widgetButtonIcon == Icons.check_box_outline_blank) {
            widgetBarActiveGrid = !widgetBarActiveGrid;
          }
          if (widget.widgetButtonIcon == Icons.insert_emoticon) {
            widgetBarActiveSvg = !widgetBarActiveSvg;
          }

          context.read<WidgetFunctions>().addThisModel(myModel);
        },
        child: Container(
            color: Colors.white,
            width: 45,
            height: 45,
            child: Icon(
              widget.widgetButtonIcon,
              color: selectedColor,
            )));
  }
}
