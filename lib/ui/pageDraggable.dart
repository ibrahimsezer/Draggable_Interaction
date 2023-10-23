import 'package:draggable_example/ui/widgets/openerWidgets.dart';
import 'package:draggable_example/utils/widgetAreaControl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/interfaceButtons.dart';

double globalPosX = 0;
double globalPosY = 0;
double containerLeft = 0;
double containerTop = 0;
bool isResizing = false;
Offset startPosition = Offset.zero;
String tempText = "";

class PageDraggable extends StatefulWidget with ChangeNotifier {
  PageDraggable({super.key});

  static List<Widget> widgets = [];

  void addWidget(Widget widget) {
    PageDraggable.widgets.add(widget);
    notifyListeners();
    print("${widgets.toList()}");
  }

  void removeWidget(Widget widget) {
    PageDraggable.widgets.remove(widget);
    notifyListeners();
  }

  @override
  State<PageDraggable> createState() => _PageDraggableState();
}

class _PageDraggableState extends State<PageDraggable> with ChangeNotifier {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          // AreaControlWidget(),
          Consumer<PageDraggable>(
            builder: (context, value, child) {
              return Positioned(
                  top: 5,
                  left: 250,
                  child: Text("| x: $globalPosX \n| y: $globalPosY "));
            },
          ),
          Consumer<PageDraggable>(
            builder: (context, value, child) {
              return Stack(
                children: [...PageDraggable.widgets],
              );
            },
          ),

          ///Create Widget Button
          const CreateWidget(),

          ///Create Text Widget Button
          const CreateTextWidget(),

          ///Delete Button
          const DeleteWidget(),

          ///Resizeable Widget Button
          const ResizeableWidget(),

        ]),
      ),
    );
  }
}
