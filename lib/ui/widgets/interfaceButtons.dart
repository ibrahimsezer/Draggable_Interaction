import 'package:draggable_example/exmp/thisModel.dart';
import 'package:draggable_example/model/widgetModel.dart';
import 'package:draggable_example/ui/widgets/imageWidget.dart';
import 'package:draggable_example/ui/widgets/listViewBuilder.dart';
import 'package:draggable_example/ui/widgets/moduler_widget.dart';
import 'package:draggable_example/ui/widgets/noteWidget.dart';
import 'package:draggable_example/ui/widgets/openerWidget.dart';
import 'package:draggable_example/ui/widgets/shape.dart';
import 'package:draggable_example/ui/widgets/stickyNoteWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

int idCounter = 0;

class WidgetButtonClass extends StatefulWidget {
  const WidgetButtonClass({super.key});

  @override
  State<WidgetButtonClass> createState() => _WidgetButtonClassState();
}

class _WidgetButtonClassState extends State<WidgetButtonClass> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        WidgetButtonModule(
          myHeight: 100,
          myWidth: 100,
          widgetButtonName: TriangleShapeWidget(),
          widgetButtonIcon: Icons.play_arrow_sharp,
          posX: 240,
          posY: 90,
        ),
        WidgetButtonModule(
          myHeight: 100,
          myWidth: 100,
          widgetButtonName: CircleWidget(),
          widgetButtonIcon: Icons.circle,
          posX: 240,
          posY: 30,
        ),
        WidgetButtonModule(
          myHeight: 50,
          myWidth: 230,
          widgetButtonName: OpenerTopWidget(),
          widgetButtonIcon: Icons.open_in_new_rounded,
          posX: 170,
          posY: 90,
        ),
        WidgetButtonModule(
          myHeight: 100,
          myWidth: 100,
          widgetButtonName:
              StickyNoteWidget(initialColor: Colors.lightBlueAccent),
          widgetButtonIcon: Icons.sticky_note_2_rounded,
          posX: 100,
          posY: 30,
        ),
        WidgetButtonModule(
          myHeight: 100,
          myWidth: 100,
          widgetButtonName: NoteWidget(),
          widgetButtonIcon: Icons.text_rotation_angledown,
          posX: 30,
          posY: 90,
        ),
        WidgetButtonModule(
          myHeight: 100,
          myWidth: 100,
          widgetButtonName: RectangleShapeWidget(),
          widgetButtonIcon: Icons.pix,
          posX: 170,
          posY: 30,
        ),
        WidgetButtonModule(
          myHeight: 100,
          myWidth: 100,
          widgetButtonName: RoundedRectangleShapeWidget(),
          widgetButtonIcon: Icons.text_fields,
          posX: 100,
          posY: 90,
        ),
        WidgetButtonModule(
          myHeight: 100,
          myWidth: 100,
          widgetButtonName: ListViewWidget(),
          widgetButtonIcon: Icons.add,
          posX: 30,
          posY: 30,
        ),
        WidgetButtonModule(
          myHeight: 100,
          myWidth: 100,
          widgetButtonName: TriangleShapeWidget(),
          widgetButtonIcon: Icons.play_arrow_sharp,
          posX: 240,
          posY: 90,
        ),
        WidgetButtonModule(
          myHeight: 100,
          myWidth: 100,
          widgetButtonName: RhombusShapeWidget(),
          widgetButtonIcon: Icons.layers_rounded,
          posX: 300,
          posY: 30,
        ),
        WidgetButtonModule(
          myHeight: 200,
          myWidth: 150,
          widgetButtonName: RightArrowWidget(),
          widgetButtonIcon: Icons.arrow_forward,
          posX: 30,
          posY: 150,
        ),
        WidgetButtonModule(
            widgetButtonName: StarWidget(),
            widgetButtonIcon: Icons.star,
            posX: 350,
            posY: 30,
            myWidth: 80,
            myHeight: 80),
        WidgetButtonModule(
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/sqldeveloper.svg'),
            widgetButtonIcon: Icons.data_saver_off_outlined,
            posX: 350,
            posY: 90,
            myWidth: 80,
            myHeight: 80),
        WidgetButtonModule(
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/outline-cloud.svg'),
            widgetButtonIcon: Icons.cloud,
            posX: 300,
            posY: 90,
            myWidth: 80,
            myHeight: 80),
      ],
    );
  }
}

///-------------------------Widget_Button_Module----------------------------------
class WidgetButtonModule extends StatefulWidget {
  final Widget widgetButtonName;
  final IconData widgetButtonIcon;
  final double posX;
  final double posY;
  final double myWidth;
  final double myHeight;

  const WidgetButtonModule({
    super.key,
    required this.widgetButtonName,
    required this.widgetButtonIcon,
    required this.posX,
    required this.posY,
    required this.myWidth,
    required this.myHeight,
  });

  @override
  State<WidgetButtonModule> createState() => _WidgetButtonModuleState();
}

class _WidgetButtonModuleState extends State<WidgetButtonModule> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.posY,
      right: widget.posX,
      child: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 25,
        child: IconButton(
            color: Colors.black,
            onPressed: () {
              ThisModel myModel = ThisModel(
                  id: idCounter,
                  widget: ModulerWidget(
                      myPosX: 0,
                      myPosY: 0,
                      initialWidth: widget.myWidth,
                      initialHeight: widget.myHeight,
                      widgetVariable: widget.widgetButtonName),
                  isActive: false);
              context.read<WidgetFunctions>().addThisModel(myModel);
            },
            icon: Icon(widget.widgetButtonIcon)),
      ),
    );
  }
}
