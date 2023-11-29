import 'package:draggable_example/ui/widgets/priorty_status.dart';
import 'package:draggable_example/ui/widgets/shape.dart';
import 'package:draggable_example/ui/widgets/sticky_note_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'image_widget.dart';
import 'interface_buttons.dart';
import 'note_widget.dart';

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
  const ActivityGridSvgBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.white,
      child: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        children: const [
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/sqldeveloper.svg'),
            widgetButtonIcon: Icons.save,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/azurefunctions.svg'),
            widgetButtonIcon: Icons.functions,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/azuresqldatabase.svg'),
            widgetButtonIcon: Icons.data_saver_off_outlined,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/firewall-outline-alerted.svg'),
            widgetButtonIcon: Icons.bus_alert,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/firewall-outline-badged.svg'),
            widgetButtonIcon: Icons.confirmation_num,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/folder-type-azure-opened.svg'),
            widgetButtonIcon: Icons.open_in_browser,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/outline-cloud-done.svg'),
            widgetButtonIcon: Icons.cloud_done,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/person-16-filled.svg'),
            widgetButtonIcon: Icons.supervised_user_circle,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName:
                CreateImageWidget(assetName: 'lib/assets/images/process.svg'),
            widgetButtonIcon: Icons.engineering_outlined,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName:
                CreateImageWidget(assetName: 'lib/assets/images/security.svg'),
            widgetButtonIcon: Icons.security,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/upload-web.svg'),
            widgetButtonIcon: Icons.upload_file,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/user-security-fill.svg'),
            widgetButtonIcon: Icons.supervised_user_circle,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName: CreateImageWidget(
                assetName: 'lib/assets/images/outline-cloud.svg'),
            widgetButtonIcon: Icons.cloud_circle_outlined,
          ),
          ActivityBarIcon(
            myHeight: 100,
            myWidth: 100,
            widgetButtonName:
                CreateImageWidget(assetName: 'lib/assets/images/security1.svg'),
            widgetButtonIcon: Icons.security_update_good,
          ),
        ],
      ),
    );
  }
}
