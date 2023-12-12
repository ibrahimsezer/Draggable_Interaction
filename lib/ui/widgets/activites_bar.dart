import 'package:draggable_example/ui/widgets/shape.dart';
import 'package:draggable_example/ui/widgets/sticky_note_widget.dart';
import 'package:flutter/material.dart';
import 'image_widget.dart';
import 'interface_buttons.dart';

class ActivityBar extends StatelessWidget {
  ActivityBar({super.key});

  bool activeWidgets = false;
  List gridView = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 310,
      color: Colors.white,
      child: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        children: [
          const ActivityBarIcon(
              widgetButtonName: SizedBox(),
              widgetButtonIcon: Icons.near_me,
              myWidth: 0,
              myHeight: 0),
          ActivityBarIcon(
              widgetButtonName: SizedBox(
                child: TextField(
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  textAlign: TextAlign.center,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.none),
                ),
              ),
              widgetButtonIcon: Icons.title,
              myWidth: 20,
              myHeight: 20),
          ActivityBarIcon(
              widgetButtonName:
                  activeWidgets ? const ActivityGridBar() : const SizedBox(),
              widgetButtonIcon: Icons.check_box_outline_blank,
              myWidth: 0,
              myHeight: 0),
          const ActivityBarIcon(
              widgetButtonName: SizedBox(),
              widgetButtonIcon: Icons.insert_emoticon,
              myWidth: 0,
              myHeight: 0),
          const ActivityBarIcon(
              widgetButtonName: SizedBox(),
              widgetButtonIcon: Icons.undo,
              myWidth: 0,
              myHeight: 0),
          const ActivityBarIcon(
              widgetButtonName: SizedBox(),
              widgetButtonIcon: Icons.redo,
              myWidth: 0,
              myHeight: 0),
        ],
      ),
    );
  }
}

class ActivityGridBar extends StatelessWidget {
  const ActivityGridBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.white,
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          children: const [
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: StickyNoteWidget(
                  initialColor: Color.fromRGBO(190, 49, 68, 1)),
              widgetButtonIcon: Icons.sticky_note_2,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: StarWidget(),
              widgetButtonIcon: Icons.star,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: RightArrowWidget(),
              widgetButtonIcon: Icons.arrow_right_alt,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: EllipseShapeWidget(),
              widgetButtonIcon: Icons.circle_outlined,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: RectangleShapeWidget(),
              widgetButtonIcon: Icons.rectangle,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: RoundedRectangleShapeWidget(),
              widgetButtonIcon: Icons.rounded_corner,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: RhombusShapeWidget(),
              widgetButtonIcon: Icons.format_shapes,
            ),
            ActivityBarIcon(
              myHeight: 100,
              myWidth: 100,
              widgetButtonName: CircleWidget(),
              widgetButtonIcon: Icons.circle,
            ),
            ActivityBarIcon(
                widgetButtonName: TriangleShapeWidget(),
                widgetButtonIcon: Icons.play_arrow_rounded,
                myWidth: 100,
                myHeight: 100),
          ]),
    );
  }
}

class ActivityGridSvgBar extends StatelessWidget {
  ActivityGridSvgBar({super.key});

  final List<String> _assetNames = [
    'lib/assets/images/sqldeveloper.svg',
    'lib/assets/images/azurefunctions.svg',
    'lib/assets/images/azuresqldatabase.svg',
    'lib/assets/images/firewall-outline-alerted.svg',
    'lib/assets/images/firewall-outline-badged.svg',
    'lib/assets/images/folder-type-azure-opened.svg',
    'lib/assets/images/outline-cloud-done.svg',
    'lib/assets/images/person-16-filled.svg',
    'lib/assets/images/process.svg',
    'lib/assets/images/security.svg',
    'lib/assets/images/upload-web.svg',
    'lib/assets/images/user-security-fill.svg',
    'lib/assets/images/outline-cloud.svg',
    'lib/assets/images/security1.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.white,
      child: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        children: [
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[0]),
            widgetButtonIcon: Icons.save,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[1]),
            widgetButtonIcon: Icons.functions,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[2]),
            widgetButtonIcon: Icons.data_saver_off_outlined,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[3]),
            widgetButtonIcon: Icons.bus_alert,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[4]),
            widgetButtonIcon: Icons.confirmation_num,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[5]),
            widgetButtonIcon: Icons.open_in_browser,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[6]),
            widgetButtonIcon: Icons.cloud_done,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[7]),
            widgetButtonIcon: Icons.supervised_user_circle,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[8]),
            widgetButtonIcon: Icons.engineering_outlined,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[9]),
            widgetButtonIcon: Icons.security,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[10]),
            widgetButtonIcon: Icons.upload_file,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[11]),
            widgetButtonIcon: Icons.supervised_user_circle,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[12]),
            widgetButtonIcon: Icons.cloud_circle_outlined,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(assetName: _assetNames[13]),
            widgetButtonIcon: Icons.security_update_good,
          ),
        ],
      ),
    );
  }
}
