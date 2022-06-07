import 'package:flutter/material.dart';

class Deadlines extends StatefulWidget {
  const Deadlines({ Key key }) : super(key: key);

  @override
  _DeadlinesState createState() => _DeadlinesState();
}

class _DeadlinesState extends State<Deadlines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Important Deadlines'),),
      body:(Text('are you on schedule?'))
    );
  }
}