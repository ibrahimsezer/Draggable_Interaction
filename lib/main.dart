import 'package:draggable_example/model/menu_activity.dart';
import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/ui/main_board.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'Data/data_hive.dart';
import 'model/this_model.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final directory = await getApplicationDocumentsDirectory();
  // await Hive.initFlutter(directory.path);
  // print(directory.path);
  // HiveData().getCollection();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainBoard(),
        ),
        ChangeNotifierProvider(
          create: (context) => WidgetFunctions(),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuActivity(),
        ),
      ],
      child: MaterialApp(
        home: MainBoard(),
      )));
}
