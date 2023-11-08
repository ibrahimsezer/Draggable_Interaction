import 'package:draggable_example/exmp/thisModel.dart';
import 'package:draggable_example/model/widgetModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'widgets/interfaceButtons.dart';

double globalPosX = 0;
double globalPosY = 0;
double containerLeft = 0;
double containerTop = 0;
bool isResizing = false;
Offset startPosition = Offset.zero;
String tempText = "";

class MainBoard extends StatefulWidget with ChangeNotifier {
  MainBoard({super.key});

  static List<Widget> widgets = [];

  void addWidget(Widget widget) {
    widgets.add(widget);
    notifyListeners();
  }

  void removeWidget(Widget widget) {
    widgets.remove(widget);
    notifyListeners();
  }

  void removeWidgetInt(int id) {
    widgets.removeAt(id);
    notifyListeners();
  }

  void allRemoveWidget() {
    ThisModel.thisModelList.clear();
    ThisModel.thisModelActiveList.clear();
    widgets.clear();
    notifyListeners();
  }

  @override
  State<MainBoard> createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
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
          Consumer<MainBoard>(
            builder: (context, value, child) {
              return Positioned(
                  top: 5,
                  left: 250,
                  child: Text("| x: $globalPosX \n| y: $globalPosY "));
            },
          ),
          Consumer<WidgetFunctions>(
            builder: (context, value, child) {
              return Stack(
                children: [
                  ...ThisModel.thisModelList.map((e) => e.widget)
                  //...WidgetModel.widgetModelList.map((e) => e.widget)
                ],
              );
            },
          ),

          ///Delete Button
          const DeleteWidget(),

          ///Color Button
          Positioned(
              bottom: 120,
              left: 35,
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
                  child: const Text("Colors"))),

          ///Create Widget Button
          const CreateWidget(),

          ///Create Text Widget Button
          const CreateTextWidget(),

          ///Resizeable Widget Button
          const ResizeableWidget(),

          ///StickyNote Widget Button
          const StickyNoteWidgetButton(),

          ///Example Widget Button
          const ExampleWidgetButton(),

          ///Opener Widget Button
          const OpenerWidgetButton()
        ]),
      ),
    );
  }
}
