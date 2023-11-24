import 'package:draggable_example/model/this_model.dart';
import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/ui/widgets/activites_bar.dart';
import 'package:draggable_example/ui/widgets/grid_view_background.dart';
import 'package:draggable_example/ui/widgets/interface_buttons.dart';
import 'package:draggable_example/ui/widgets/priorty_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//todo Widget frames remain unclickable after resizing
//todo Widget delete with using topBarMenu
//todo Right and bottom frames not locked. Lock this
//todo Edit widget button folder
//todo Save widget info in database
//todo Group widgets
//todo Add widget in board
//todo Move widget to front or back

double globalPosY = 0;
double globalPosX = 0;
double containerLeft = 0;
double containerTop = 0;
bool isResizing = false;
Offset startPosition = Offset.zero;
String tempText = "";

class MainBoard extends StatefulWidget with ChangeNotifier {
  MainBoard({super.key});

  static List<ThisModel> widgets = [];
  static List<Widget> activeWidgetList = [];

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

  void activeWidgetListAdd() {
    for (int i = 0; i < ThisModel.thisModelList.length; i++) {
      if (ThisModel.thisModelList[i].isActive == true) {
        activeWidgetList.add(ThisModel.thisModelList[i].widget);
      }
    }
  }

  void activePosition() {
    for (int i = 0; i < activeWidgetList.length; i++) {
      activeWidgetList[i];
    }
  }

  @override
  State<MainBoard> createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  Widget getGridWidget = const GridViewBackground();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Stack(children: <Widget>[
          Consumer<WidgetFunctions>(
            builder: (context, value, child) {
              return InteractiveViewer(
                minScale: 1,
                maxScale: 1000,
                child: Stack(
                  children: [
                    AbsorbPointer(child: getGridWidget),
                    ...ThisModel.thisModelList.map((e) => e.widget),
                  ],
                ),
              );
            },
          ),
          Positioned(top: 100, left: 5, child: ActivityBar()),
          ...MainBoard.widgets.map((e) => e.widget),
          Consumer<WidgetFunctions>(
            builder:
                (BuildContext context, WidgetFunctions value, Widget? child) {
              return widgetBarActiveGrid
                  ? const Positioned(
                      top: 100, left: 60, child: ActivityGridBar())
                  : const SizedBox();
            },
          ),
          Consumer<WidgetFunctions>(
            builder:
                (BuildContext context, WidgetFunctions value, Widget? child) {
              return widgetBarActiveSvg
                  ? const Positioned(
                      top: 260, left: 60, child: ActivityGridSvgBar())
                  : const SizedBox();
            },
          ),
          Positioned(
              top: 450,
              left: 100,
              child: Stack(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PriorityStatus(prioTitle: "Ideas"),
                              PriorityStatus(prioTitle: "In Progress"),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PriorityStatus(prioTitle: "Postponed"),
                              PriorityStatus(prioTitle: "Completed"),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
