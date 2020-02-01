import 'package:flutter/material.dart';
import 'package:minimal_todo/blocs/list_bloc.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    String _tempString = "";
    final ListBloc listBloc = Provider.of<ListBloc>(context);

    Future<void> _addTasks() async {
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Colors.white,
              title: Text("Do sumthin? Really?"),
              content: SingleChildScrollView(
                child: TextField(
                  autocorrect: false,
                  autofocus: true,
                  cursorColor: Colors.black,
                  enabled: true,
                  enableSuggestions: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  textAlign: TextAlign.justify,
                  onChanged: (text) {
                    _tempString = text;
                  },
                ),
                padding: const EdgeInsets.all(10.0),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Meh!'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                FlatButton(
                  child: Text('Woah!'),
                  onPressed: () {
                    listBloc.add(_tempString);
                    _tempString = "";
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

    return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 200.0,
            crossAxisAlignment: WrapCrossAlignment.end,
            direction: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                  left: 38.0,
                ),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: null,
                  color: Colors.white,
                  disabledColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                  right: 38.0,
                ),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: null,
                  color: Colors.white,
                  disabledColor: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 80.0,
            height: 100.0,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 28.0,
              ),
              child: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  size: 35.0,
                  color: Colors.black,
                ),
                onPressed: () => _addTasks(),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ]);
  }
}
