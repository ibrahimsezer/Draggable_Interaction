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
    double screenX = MediaQuery.sizeOf(context).width; //horizontal screen area
    double screenY = MediaQuery.sizeOf(context).height; //vertical screen area
    double activityBarPosY = screenY * 0.05;
    double activityBarPosX = screenY * 0.02;

///widgetBarActiveGrid
    checkActivityGridBarPosY(){
      double activityBarPosY1 = activityBarPosY;
      double activityBarPosY2 = activityBarPosY * 1;
      return [activityBarPosY1, activityBarPosY2];
    }
    List<double> gridBarListY = checkActivityGridBarPosY();

    checkActivityGridBarPosX() {
      double activityBarPosX1 = activityBarPosX * 8;
      double activityBarPosX2 = activityBarPosX * 4.5;
      return [activityBarPosX1, activityBarPosX2];
    }
    List<double> gridBarListX = checkActivityGridBarPosX();
///widgetBarActiveSvg
    checkActivityGridSvgPosY(){
      double activitySvgPosY1 = activityBarPosY * 9.6;
      double activitySvgPosY2 = activityBarPosY * 5;
      return [activitySvgPosY1, activitySvgPosY2];
    }
    List<double> gridSvgListY = checkActivityGridSvgPosY();

    checkActivityGridSvgPosX() {
      double activitySvgPosX1 = activityBarPosX * 8;
      double activitySvgPosX2 = activityBarPosX * 4.5;
      return [activitySvgPosX1, activitySvgPosX2];
    }
    List<double> gridSvgListX = checkActivityGridSvgPosX();


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
          Consumer(
            builder: (context, value, child) {
              return Positioned(
                  top: activityBarPosY,
                  left: activityBarPosX,
                  child: ActivityBar());
            },
          ),
          ...MainBoard.widgets.map((e) => e.widget),
          Consumer<WidgetFunctions>(
            builder:
                (BuildContext context, WidgetFunctions value, Widget? child) {
              return widgetBarActiveGrid
                  ? Positioned(
                      top: (screenY < screenX)
                          ? gridBarListY[0].toDouble()
                          : gridBarListY[1].toDouble(),
                      left: (screenY < screenX)
                          ? gridBarListX[0].toDouble()
                          : gridBarListX[1].toDouble(),
                      child: const ActivityGridBar())
                  : const SizedBox();
            },
          ),
          Consumer<WidgetFunctions>(
            builder:
                (BuildContext context, WidgetFunctions value, Widget? child) {
              return widgetBarActiveSvg
                  ? Positioned(
                      top: (screenY < screenX)
                          ? gridSvgListY[0].toDouble()
                          : gridSvgListY[1].toDouble(),
                      left: (screenY < screenX)
                          ? gridSvgListX[0].toDouble()
                          : gridSvgListX[1].toDouble(),
                      child: const ActivityGridSvgBar())
                  : const SizedBox();
            },
          ),
        ]),
      ),
    );
  }
}
