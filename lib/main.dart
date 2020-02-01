import 'package:flutter/material.dart';
import 'package:minimal_todo/blocs/list_bloc.dart';
import 'package:minimal_todo/homepage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ListBloc()),
      ],
      child: MaterialApp(
        title: 'Minimal To-do List',
        theme: ThemeData(
          primaryColor: Colors.black,
          bottomAppBarColor: Colors.black,
          backgroundColor: Colors.black,
          accentColor: Colors.white,
          canvasColor: Colors.black,
        ),
        home: HomePage(),
      ),
    );
  }
}
