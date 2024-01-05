import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/providers/widget_provider.dart';
import 'package:draggable_example/ui/widgets/activities_bar/activity_grid_bar.dart';
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
  });

  final Widget widgetButtonName;
  final IconData widgetButtonIcon;

  @override
  State<ActivityBarIcon> createState() => _ActivityBarIconState();
}

class _ActivityBarIconState extends State<ActivityBarIcon> {
  Color selectedColor = Colors.black;

  get defaultWidgetSizeW => context.read<WidgetProvider>().getWidgetWidth;

  get defaultWidgetSizeH => context.read<WidgetProvider>().getWidgetHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            final screen = MediaQuery.sizeOf(context);
            double screenWidth = screen.width;
            double screenHeight = screen.height;
            double newPosX = ((screenWidth * 0.5) - (defaultWidgetSizeW / 2));
            double newPosY = ((screenHeight * 0.5) - (defaultWidgetSizeH / 2));
            context.read<WidgetProvider>().addWidgetModel(ModularWidget(
                  model: WidgetModel(
                      posX: context.read<WidgetProvider>().activityBarPosX,
                      posY: context.read<WidgetProvider>().activityBarPosY,
                      id: ++idCounter),
                  child: widget.widgetButtonName,
                ));
            context.read<WidgetProvider>().getWidgetWidth = defaultWidgetSizeW;
            context.read<WidgetProvider>().getWidgetHeight = defaultWidgetSizeH;
          });

          if (widget.widgetButtonIcon == Icons.window_outlined) {
            widgetBarActiveGrid = !widgetBarActiveGrid;
          }
          if (widget.widgetButtonIcon == Icons.widgets_outlined) {
            widgetBarActiveSvg = !widgetBarActiveSvg;
          }
          if (widget.widgetButtonIcon == Icons.delete) {
            context.read<WidgetProvider>().allRemoveWidget();
          }
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
