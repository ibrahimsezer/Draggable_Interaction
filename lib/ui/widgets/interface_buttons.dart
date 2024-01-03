import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/providers/widget_provider.dart';
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
    required this.activityBarWidth,
    required this.activityBarHeight,
  });

  final Widget widgetButtonName;
  final IconData widgetButtonIcon;
  final double activityBarWidth;
  final double activityBarHeight;

  double get getActivityBarWidth => activityBarWidth;

  double get getActivityBarHeight => activityBarHeight;

  @override
  State<ActivityBarIcon> createState() => _ActivityBarIconState();
}

class _ActivityBarIconState extends State<ActivityBarIcon> {
  Color selectedColor = Colors.black;
  final double doubleDefaultValue = 100;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          WidgetModel myModel = WidgetModel(
            height: widget.activityBarHeight,
            width: widget.activityBarWidth,
            posX: doubleDefaultValue,
            posY: doubleDefaultValue,
            id: idCounter,
            widget: ModularWidget(
              modularPosX: context.read<WidgetProvider>().activityBarPosX,
              modularPosY: context.read<WidgetProvider>().activityBarPosY,
              modularWidth: widget.activityBarWidth,
              modularHeight: widget.activityBarHeight,
              modularWidget: widget.widgetButtonName,
              id: idCounter++,
            ),
          );

          context.read<WidgetProvider>().getWidgetWidth = myModel.width;
          context.read<WidgetProvider>().getWidgetHeight = myModel.height;
          if (widget.widgetButtonIcon == Icons.window_outlined) {
            widgetBarActiveGrid = !widgetBarActiveGrid;
          }
          if (widget.widgetButtonIcon == Icons.widgets_outlined) {
            widgetBarActiveSvg = !widgetBarActiveSvg;
          }
          if (widget.widgetButtonIcon == Icons.delete) {
            context.read<WidgetProvider>().allRemoveWidget();
          }
          context.read<WidgetProvider>().addWidgetModel(myModel);
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
