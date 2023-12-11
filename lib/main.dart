import 'package:draggable_example/model/widget_model.dart';
import 'package:draggable_example/ui/main_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//add dependencies
//create class
//auto generate class.g
//init flutter
//register adapter
//openbox create box file
//get | put | deleteAt | clear

Future<void> main() async {
  // await Hive.initFlutter();
  // Hive.registerAdapter(WidgetDataAdapter());

//todo   boxPersons = await Hive.openBox<Person>('personBox');
//todo   boxPersons.put
//todo   boxPersons.deleteAt(index);
//todo   boxPersons.clear();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainBoard(),
        ),
        ChangeNotifierProvider(
          create: (context) => WidgetFunctions(),
        ),
      ],
      child: MaterialApp(
        home: MainBoard(),
      )));
}
