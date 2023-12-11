import 'package:draggable_example/model/this_model.dart';
import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/ui/widgets/activites_bar.dart';
import 'package:draggable_example/ui/widgets/grid_view_background.dart';
import 'package:draggable_example/ui/widgets/interface_buttons.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../Data/boxes.dart';
import '../Data/widget_data.dart';

//todo Widget frames remain unclickable after resizing
//todo Widget delete with using topBarMenu
//todo Right and bottom frames not locked. Lock this
//todo Edit widget button folder
//todo Save widget info in database
//todo Group widgets
//todo Add widget in board
//todo Move widget to front or back
//todo Create Hive database

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
  static List<WidgetData> widgetDataList = [];

  Future<void> addHiveData(WidgetData model) async {
    box = await Hive.openBox("widgetDataBox");
    box.put("key_${model.id}_${model.text}", model);
    var values = box.values.toList();
    for (int i = 0; i < box.values.length; i++) {
      widgetDataList.add(values[i]);
      print("${widgetDataList.toList()}");
    }
  }

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
  //Widget getGridWidget = const GridViewBackground();
  Widget getGridBackground = const GridBackground();

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
                    AbsorbPointer(child: getGridBackground),
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
        ]),
      ),
    );
  }
}
