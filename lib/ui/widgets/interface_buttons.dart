import 'dart:developer';

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
  ActivityBarIcon({
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
  final double doubleDefaultValue = 100;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          WidgetModel myModel = WidgetModel(
            //test
            height: widget.myHeight,
            width: widget.myWidth,
            posX: doubleDefaultValue,
            posY: doubleDefaultValue,
            id: idCounter,
            widget: ModularWidget(
              myPosX: MediaQuery.sizeOf(context).width * 0.4,
              myPosY: MediaQuery.sizeOf(context).height * 0.4,
              initialWidth: widget.myWidth,
              initialHeight: widget.myHeight,
              widgetVariable: widget.widgetButtonName,
              id: idCounter++,
            ),
          );
          if (widget.widgetButtonIcon == Icons.window_outlined) {
            widgetBarActiveGrid = !widgetBarActiveGrid;
          }
          if (widget.widgetButtonIcon == Icons.widgets_outlined) {
            widgetBarActiveSvg = !widgetBarActiveSvg;
          }
          if (widget.widgetButtonIcon == Icons.delete) {
            context.read<WidgetProvider>().allRemoveWidget();
            print(WidgetModel.widgetModelList.toList());
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
