import 'package:flutter/material.dart';
import 'package:minimal_todo/pages/home_screen.dart';
import 'package:minimal_todo/widgets/custom_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Padding(
          padding: EdgeInsets.all(20.0),  
          child: HomeScreen()),
        bottomNavigationBar:
            SizedBox(width: 100.0, height: 100.0, child: CustomBottomNavBar()),
      ),
    );
  }
}
