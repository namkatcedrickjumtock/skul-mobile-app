import 'package:flutter/material.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key key}) : super(key: key);

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('My courses'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(
            borderOnForeground: true,
            clipBehavior: null,
            color: Colors.white,
            elevation: .2,
            child: Text('Mathematics'),
          )
        ],
      ),
    );
  }
}
