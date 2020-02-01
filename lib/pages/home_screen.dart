import 'package:flutter/material.dart';
import 'package:minimal_todo/blocs/list_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //Reference to the bloc
    final ListBloc listBloc = Provider.of<ListBloc>(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 170.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Tasks",
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
            titlePadding: EdgeInsets.only(
              left: 25.0,
              bottom: 15.0,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 100.0,
          delegate: SliverChildBuilderDelegate(
            (context, index) => _customListTile(context,
                listBloc.tasks[index].id, listBloc.tasks[index].task, listBloc),
            childCount: listBloc.tasks.length,
          ),
        ),
      ],
    );
  }

  //Widget to build tile
  Widget _customListTile(
      BuildContext context, int id, String task, ListBloc bloc) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) => bloc.deleteAt(id),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF121212),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      task,
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
