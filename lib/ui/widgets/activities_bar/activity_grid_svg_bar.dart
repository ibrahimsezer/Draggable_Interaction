import 'package:draggable_example/ui/widgets/image_widget.dart';
import 'package:draggable_example/ui/widgets/interface_buttons.dart';
import 'package:flutter/material.dart';

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
      color: Colors.white,
      width: 150,
      height: 150,
      child: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        children: [
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[0]),
            widgetButtonIcon: Icons.save,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[1]),
            widgetButtonIcon: Icons.functions,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[2]),
            widgetButtonIcon: Icons.data_saver_off_outlined,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[3]),
            widgetButtonIcon: Icons.bus_alert,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[4]),
            widgetButtonIcon: Icons.confirmation_num,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[5]),
            widgetButtonIcon: Icons.open_in_browser,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[6]),
            widgetButtonIcon: Icons.cloud_done,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[7]),
            widgetButtonIcon: Icons.supervised_user_circle,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[8]),
            widgetButtonIcon: Icons.engineering_outlined,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[9]),
            widgetButtonIcon: Icons.security,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[10]),
            widgetButtonIcon: Icons.upload_file,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[11]),
            widgetButtonIcon: Icons.supervised_user_circle,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[12]),
            widgetButtonIcon: Icons.cloud_circle_outlined,
          ),
          ActivityBarIcon(
            widgetButtonName: CreateImageWidget(assetName: _assetNames[13]),
            widgetButtonIcon: Icons.security_update_good,
          ),
        ],
      ),
    );
  }
}
