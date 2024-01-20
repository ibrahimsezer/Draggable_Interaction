import 'package:draggable_example/providers/widget_provider.dart';
import 'package:draggable_example/ui/widgets/activities_bar/activity_bar.dart';
import 'package:draggable_example/ui/widgets/activities_bar/activity_grid_bar.dart';
import 'package:draggable_example/ui/widgets/activities_bar/activity_grid_svg_bar.dart';
import 'package:draggable_example/ui/widgets/interface_buttons.dart';
import 'package:draggable_example/ui/widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

double globalPosY = 0;
double globalPosX = 0;
double containerLeft = 0;
double containerTop = 0;
bool isResizing = false;
Offset startPosition = Offset.zero;

class MainBoard extends StatefulWidget {
  const MainBoard({super.key});

  static List<double> getPosition() =>
      [_MainBoardState().mainPosX, _MainBoardState().mainPosY];

  @override
  State<MainBoard> createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  double mainPosX = 0;
  double mainPosY = 0;
  double thisActivityBarPosY = 0;
  double thisActivityBarPosX = 0;

  double menuWidth = 75;
  double menuHeight = 75;
  String menuText = "Menu1";
  Color menuColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double screenX = size.width; //horizontal screen area
    double screenY = size.height; //vertical screen area
    thisActivityBarPosY = screenY * 0.05;
    thisActivityBarPosX = screenY * 0.02;
    double defaultWidgetSizeW = context.read<WidgetProvider>().getWidgetWidth;
    double defaultWidgetSizeH = context.read<WidgetProvider>().getWidgetHeight;

    ///widgetBarActiveGrid
    checkActivityGridBarPosY() {
      double activityBarPosY1 = thisActivityBarPosY;
      double activityBarPosY2 = thisActivityBarPosY * 2;
      return [activityBarPosY1, activityBarPosY2];
    }

    List<double> gridBarListY = checkActivityGridBarPosY();

    checkActivityGridBarPosX() {
      double activityBarPosX1 =
          thisActivityBarPosX * 8; //TV 4k X : 960.0 | Y: 540.0
      double activityBarPosX2 = thisActivityBarPosX * 4.5;
      return [activityBarPosX1, activityBarPosX2];
    }

    List<double> gridBarListX = checkActivityGridBarPosX();

    ///widgetBarActiveSvg
    checkActivityGridSvgPosY() {
      double activitySvgPosY1 = thisActivityBarPosY * 9.6;
      double activitySvgPosY2 = thisActivityBarPosY * 5.5;
      return [activitySvgPosY1, activitySvgPosY2];
    }

    List<double> gridSvgListY = checkActivityGridSvgPosY();

    checkActivityGridSvgPosX() {
      double activitySvgPosX1 = thisActivityBarPosX * 8;
      double activitySvgPosX2 = thisActivityBarPosX * 4.5;
      return [activitySvgPosX1, activitySvgPosX2];
    }

    List<double> gridSvgListX = checkActivityGridSvgPosX();

    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          Size screen = MediaQuery.sizeOf(context);
          double screenWidth = screen.width;
          double screenHeight = screen.height;
          double newPosX = ((screenWidth * 0.38) - (defaultWidgetSizeW / 2));
          double newPosY = ((screenHeight * 0.455) - (defaultWidgetSizeH / 2));
          context.read<WidgetProvider>().activityBarPosX = newPosX;
          context.read<WidgetProvider>().activityBarPosY = newPosY;
          setState(() {
            double offsetX =
                context.read<WidgetProvider>().posOffsetX + details.delta.dx;
            double offsetY =
                context.read<WidgetProvider>().posOffsetY + details.delta.dy;
            // new position update
            context.read<WidgetProvider>().activityBarPosX =
                ((screenWidth * 0.38) - (defaultWidgetSizeW / 2)) - offsetX;
            context.read<WidgetProvider>().activityBarPosY =
                ((screenHeight * 0.455) - (defaultWidgetSizeH / 2)) - offsetY;
            // offset variable update
            context.read<WidgetProvider>().posOffsetX = offsetX;
            context.read<WidgetProvider>().posOffsetY = offsetY;
          });
        },
        child: ColoredBox(
          color: Colors.white.withBlue(220),
          child: Consumer<WidgetProvider>(
            builder:
                (BuildContext context, WidgetProvider value, Widget? child) {
              return Stack(
                children: [
                  ...context.watch<WidgetProvider>().widgetModelList,
                  Positioned(
                      top: thisActivityBarPosY,
                      left: thisActivityBarPosX,
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
                        child: ActivityGridSvgBar()),
                  MenuButton(
                      screenX: screenX,
                      menuWidth: menuWidth,
                      menuHeight: menuHeight,
                      menuColor: menuColor,
                      menuText: menuText),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
