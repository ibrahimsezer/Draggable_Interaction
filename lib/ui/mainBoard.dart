import 'dart:math';
import 'package:draggable_example/exmp/thisModel.dart';
import 'package:draggable_example/model/menuActivity.dart';
import 'package:draggable_example/model/widgetModel.dart';
import 'package:draggable_example/ui/widgets/imageWidget.dart';
import 'package:draggable_example/ui/widgets/listViewBuilder.dart';
import 'package:draggable_example/ui/widgets/noteWidget.dart';
import 'package:draggable_example/ui/widgets/openerWidget.dart';
import 'package:draggable_example/ui/widgets/shape.dart';
import 'package:draggable_example/ui/widgets/stickyNoteWidget.dart';
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
          Consumer<MenuActivity>(
            builder: (context, value, child) {
              return MenuIconButton(buttonPosX: 80,
                menuIcon: Icons.arrow_downward,
              ).openBottomWidget();
            },
          )
        ]),
      ),
    );
  }
}

class MenuIconButton extends StatefulWidget {
  final IconData menuIcon;
  final double buttonPosX;
  MenuIconButton({super.key, required this.menuIcon, required this.buttonPosX});

  @override
  State<MenuIconButton> createState() => _MenuIconButtonState();

  Widget openBottomWidget() {
    if (MenuActivity.isActive) {
      print("If -> isActive : ${MenuActivity.isActive}");
      return Stack(
        children: [
          const BottomMenuWidget(),
          MenuIconButton(menuIcon: menuIcon,buttonPosX: 80),
        ],
      );
    } else {
      print("Else -> isActive : ${MenuActivity.isActive}");
      return MenuIconButton(buttonPosX: 0,
        menuIcon: Icons.arrow_upward,
      );
    }
  }
}

class _MenuIconButtonState extends State<MenuIconButton> {


  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: widget.buttonPosX,
        left: (MediaQuery.sizeOf(context).width / 2) - 37.5,
        child: InkWell(
          onTap: () {
            context.read<MenuActivity>().openButton();
            print("read....");
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromRGBO(34, 9, 44, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            width: 75,
            height: 25,
            child: Align(
                alignment: Alignment.center,
                child: Icon(widget.menuIcon, color: Colors.white)),
          ),
        ));
  }
}

class BottomMenuWidget extends StatelessWidget {
  const BottomMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        bottom: 0,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(34, 9, 44, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              topRight: Radius.circular(5.0),
            ),
          ),
          width: MediaQuery.sizeOf(context).width,
          height: 80,
          child: GridView(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10, mainAxisSpacing: 5, crossAxisCount: 1),
              children: const [
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: TriangleShapeWidget(),
                  widgetButtonIcon: Icons.play_arrow_sharp,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: CreateImageWidget(
                      assetName: 'lib/assets/images/sqldeveloper.svg'),
                  widgetButtonIcon: Icons.save,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: CreateImageWidget(
                      assetName: 'lib/assets/images/outline-cloud.svg'),
                  widgetButtonIcon: Icons.cloud,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: RectangleShapeWidget(),
                  widgetButtonIcon: Icons.rectangle,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: RoundedRectangleShapeWidget(),
                  widgetButtonIcon: Icons.rounded_corner,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: RhombusShapeWidget(),
                  widgetButtonIcon: Icons.format_shapes,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: CircleWidget(),
                  widgetButtonIcon: Icons.circle,
                ),
                WidgetButtonModule(
                  myHeight: 70,
                  myWidth: 240,
                  widgetButtonName: OpenerTopWidget(),
                  widgetButtonIcon: Icons.open_in_new_rounded,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: NoteWidget(),
                  widgetButtonIcon: Icons.note,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: StickyNoteWidget(
                      initialColor: Color.fromRGBO(190, 49, 68, 1)),
                  widgetButtonIcon: Icons.sticky_note_2,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: StarWidget(),
                  widgetButtonIcon: Icons.star,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: RightArrowWidget(),
                  widgetButtonIcon: Icons.arrow_right_alt,
                ),
                WidgetButtonModule(
                  myHeight: 100,
                  myWidth: 100,
                  widgetButtonName: EllipseShapeWidget(),
                  widgetButtonIcon: Icons.circle_outlined,
                ),
              ]),
        ));
  }
}
