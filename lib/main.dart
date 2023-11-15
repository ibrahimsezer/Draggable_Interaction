import 'package:draggable_example/model/menu_activity.dart';
import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/ui/main_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MainBoard(),
          ),
          ChangeNotifierProvider(
            create: (context) => WidgetFunctions(),
          ), ChangeNotifierProvider(
            create: (context) => MenuActivity(),
          ),
        ],
        child: MaterialApp(
          home: MainBoard(),
        )));
