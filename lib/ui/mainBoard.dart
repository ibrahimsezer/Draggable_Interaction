import 'dart:math';
import 'package:draggable_example/exmp/thisModel.dart';
import 'package:draggable_example/model/widgetModel.dart';
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

class MainBoard extends StatefulWidget with ChangeNotifier {
  MainBoard({super.key});

  bool myState = false;
  static List<ThisModel> widgets = [];

  void addWidget(ThisModel model) {
    widgets.add(model);
    notifyListeners();
  }

  void removeWidget(ThisModel model) {
    widgets.remove(model);
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
          Consumer<WidgetFunctions>(
            builder: (context, value, child) {
              return InteractiveViewer(
                minScale: 1,
                maxScale: 1000,
                child: Stack(
                  children: [
                    ...ThisModel.thisModelList.map((e) => e.widget),
                    //...WidgetModel.widgetModelList.map((e) => e.widget)
                  ],
                ),
              );
            },
          ),
          ...MainBoard.widgets.map((e) => e.widget),

          ///Widget Button Class
          Positioned(
              bottom: 120,
              left: 35,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ThisModel myButtonModel = ThisModel(
                          id: 0,
                          widget: const WidgetButtonClass(),
                          isActive: false);
                      widget.myState = !widget.myState;
                      if (widget.myState) {
                        MainBoard.widgets.add(myButtonModel);
                      } else {
                        MainBoard.widgets.removeWhere((element) =>
                            element.widget == myButtonModel.widget);
                      }
                    });
                  },
                  child: const Text("Shapes"))),
        ]),
      ),
    );
  }
}
