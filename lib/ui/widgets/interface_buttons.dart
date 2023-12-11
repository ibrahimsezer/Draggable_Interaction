import 'package:draggable_example/model/this_model.dart';
import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/ui/widgets/activites_bar.dart';
import 'package:draggable_example/ui/widgets/moduler_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Data/widget_data.dart';

int idCounter = 0;
bool widgetBarActiveGrid = false;
bool widgetBarActiveSvg = false;

///-------------------------Widget_Button_Module--------------------------------
// class WidgetButtonModule extends StatefulWidget {
//   final Widget widgetButtonName;
//   final IconData widgetButtonIcon;
//   final double myWidth;
//   final double myHeight;
//
//   const WidgetButtonModule({
//     super.key,
//     required this.widgetButtonName,
//     required this.widgetButtonIcon,
//     required this.myWidth,
//     required this.myHeight,
//   });
//
//   @override
//   State<WidgetButtonModule> createState() => _WidgetButtonModuleState();
// }
//
// class _WidgetButtonModuleState extends State<WidgetButtonModule> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 15),
//       child: CircleAvatar(
//         backgroundColor: Colors.amberAccent,
//         radius: 25,
//         child: IconButton(
//             color: Colors.black,
//             onPressed: () {
//               ThisModel myModel = ThisModel(
//                   id: idCounter,
//                   widget: ModulerWidget(
//                     myPosX: MediaQuery.sizeOf(context).width / 2,
//                     myPosY: MediaQuery.sizeOf(context).height / 2,
//                     initialWidth: widget.myWidth,
//                     initialHeight: widget.myHeight,
//                     widgetVariable: widget.widgetButtonName,
//                     id: idCounter++,
//                   ),
//                   isActive: false);
//               context.read<WidgetFunctions>().addThisModel(myModel);
//             },
//             icon: Icon(widget.widgetButtonIcon)),
//       ),
//     );
//   }
// }

///-------------------------Activity_Bar--------------------------------
class ActivityBarIcon extends StatefulWidget {
  const ActivityBarIcon({
    super.key,
    required this.widgetButtonName,
    required this.widgetButtonIcon,
    required this.myWidth,
    required this.myHeight,
  });

  final Widget widgetButtonName;
  final IconData widgetButtonIcon;
  final double myWidth;
  final double myHeight;

  @override
  State<ActivityBarIcon> createState() => _ActivityBarIconState();
}

class _ActivityBarIconState extends State<ActivityBarIcon> {
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          ThisModel myModel = ThisModel(
              id: idCounter,
              widget: ModulerWidget(
                myPosX: MediaQuery.sizeOf(context).width * 0.4,
                myPosY: MediaQuery.sizeOf(context).height * 0.4,
                initialWidth: widget.myWidth,
                initialHeight: widget.myHeight,
                widgetVariable: widget.widgetButtonName,
                id: idCounter++,
              ),
              isActive: false);
          if (widget.widgetButtonIcon == Icons.check_box_outline_blank) {
            widgetBarActiveGrid = !widgetBarActiveGrid;
          }
          if (widget.widgetButtonIcon == Icons.insert_emoticon) {
            widgetBarActiveSvg = !widgetBarActiveSvg;
          }
          var dataModel = WidgetData(
              id: 0,
              posX: 0,
              posY: 0,
              width: 0,
              height: 0,
              text: "text",
              widgetName: const SizedBox(
                width: 50,
                height: 300,
              ));
          //context.read<MainBoard>().addHiveData(dataModel);
          context.read<WidgetFunctions>().addThisModel(myModel);
        },
        child: Container(
            color: Colors.white,
            width: 45,
            height: 45,
            child: Icon(
              widget.widgetButtonIcon,
              color: selectedColor,
            )));
  }
}
