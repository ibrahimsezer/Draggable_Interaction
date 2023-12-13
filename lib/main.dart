import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/providers/widget_provider.dart';
import 'package:draggable_example/ui/main_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WidgetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WidgetFunctions(),
        ),
      ],
      child: const MaterialApp(
        home: MainBoard(),
      )));
}
