import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:star_menu/star_menu.dart';
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

  void allRemoveWidget() {
    PageDraggable.widgets.clear();
    notifyListeners();
  }

  @override
  State<PageDraggable> createState() => _PageDraggableState();
}

class _PageDraggableState extends State<PageDraggable> with ChangeNotifier {
  int count = 0;
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

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

          ///Delete Button
          const DeleteWidget(),

          ///
          Positioned(
              bottom: 40,
              left: 120,
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        builder: (context) => AlertDialog(
                              title: const Text('Pick a Color'),
                              content: SingleChildScrollView(
                                child: MaterialPicker(
                                  pickerColor: pickerColor,
                                  onColorChanged: changeColor,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    setState(() => currentColor = pickerColor);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                        context: context);
                  },
                  child: const Text("Click"))),

          ///
          Positioned(
            bottom: 60,
            right: 30,
            child: StarMenu(
              params: const StarMenuParameters(
                shape: MenuShape.circle,
                circleShapeParams:
                    CircleShapeParams(startAngle: 90, endAngle: 180),
                animationCurve: Curves.bounceInOut,
              ),
              onStateChanged: (state) => print("state changed"),
              onItemTapped: (index, controller) {
                controller.closeMenu!();

                print("Menu item $index tapped");
              },
              items: const [
                ///Create Widget Button
                CreateWidget(),

                ///Create Text Widget Button
                CreateTextWidget(),

                ///Resizeable Widget Button
                ResizeableWidget(),

                ///StickyNote Widget Button
                StickyNoteWidgetButton(),

                ///Example Widget Button
                ExampleWidgetButton(),
              ],
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.looks_one),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
