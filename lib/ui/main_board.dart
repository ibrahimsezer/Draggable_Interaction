import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/providers/widget_provider.dart';
import 'package:draggable_example/ui/widgets/activities_bar/activity_bar.dart';
import 'package:draggable_example/ui/widgets/activities_bar/activity_grid_bar.dart';
import 'package:draggable_example/ui/widgets/activities_bar/activity_grid_svg_bar.dart';
import 'package:draggable_example/ui/widgets/interface_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

double globalPosY = 0;
double globalPosX = 0;
double containerLeft = 0;
double containerTop = 0;
bool isResizing = false;
Offset startPosition = Offset.zero;
String tempText = "";

class MainBoard extends StatefulWidget {
  MainBoard({super.key});

  static List<double> getPosition() =>
      [_MainBoardState().mainPosX, _MainBoardState().mainPosY];

  @override
  State<MainBoard> createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  double mainPosX = 0;
  double mainPosY = 0;

  @override
  Widget build(BuildContext context) {
    double screenX = MediaQuery.sizeOf(context).width; //horizontal screen area
    double screenY = MediaQuery.sizeOf(context).height; //vertical screen area
    double activityBarPosY = screenY * 0.05;
    double activityBarPosX = screenY * 0.02;

    ///widgetBarActiveGrid
    checkActivityGridBarPosY() {
      double activityBarPosY1 = activityBarPosY;
      double activityBarPosY2 = activityBarPosY;
      return [activityBarPosY1, activityBarPosY2];
    }

    List<double> gridBarListY = checkActivityGridBarPosY();

    checkActivityGridBarPosX() {
      double activityBarPosX1 =
          activityBarPosX * 8; //TV 4k X : 960.0 | Y: 540.0
      double activityBarPosX2 = activityBarPosX * 4.5;
      return [activityBarPosX1, activityBarPosX2];
    }

    List<double> gridBarListX = checkActivityGridBarPosX();

    ///widgetBarActiveSvg
    checkActivityGridSvgPosY() {
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
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            context.read<WidgetProvider>().posOffsetX += details.delta.dx;
            context.read<WidgetProvider>().posOffsetY += details.delta.dy;
          });
        },
        child: ColoredBox(
          color: Colors.white.withBlue(220),
          child: Consumer<WidgetProvider>(
            builder:
                (BuildContext context, WidgetProvider value, Widget? child) {
              return Stack(
                children: [
                  ...WidgetModel.widgetModelList.map((e) => e.widget),
                  Positioned(
                      top: activityBarPosY,
                      left: activityBarPosX,
                      child: const ActivityBar()),
                  if (widgetBarActiveGrid)
                    Positioned(
                        top: (screenY < screenX)
                            ? gridBarListY[0].toDouble()
                            : gridBarListY[1].toDouble(),
                        left: (screenY < screenX)
                            ? gridBarListX[0].toDouble()
                            : gridBarListX[1].toDouble(),
                        child: ActivityGridBar()),
                  if (widgetBarActiveSvg)
                    Positioned(
                        top: (screenY < screenX)
                            ? gridSvgListY[0].toDouble()
                            : gridSvgListY[1].toDouble(),
                        left: (screenY < screenX)
                            ? gridSvgListX[0].toDouble()
                            : gridSvgListX[1].toDouble(),
                        child: ActivityGridSvgBar())
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
