import 'package:draggable_example/model/widgetModel.dart';
import 'package:draggable_example/ui/mainBoard.dart';
import 'package:draggable_example/ui/widgets/listViewBuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MainBoard(),
          ),
          ChangeNotifierProvider(
            create: (context) => WidgetFunctions(),
          )
        ],
        child: MaterialApp(
          home: MainBoard(),
        )));
