import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HIBMAT calendar of activities'),
      ),
      body: ListView(
        children: [
          Card(
            child: Text('October'),
          ),
          Card(
            child: Text('November'),
          ),
          Card(
            child: Text('December'),
          ),
          Card(
            child: Text('January'),
          ),
          Card(
            child: Text('February'),
          ),
          Card(
            child: Text('march'),
          ),
          Card(
            child: Text('April'),
          ),
          Card(
            child: Text('May'),
          ),
          Card(
            child: Text('June'),
          ),
          Card(
            child: Text('July'),
          ),
          Card(
            child: Text('August'),
          ),
          Card(
            child: Text('September'),
          ),
        ],
      ),
    );
  }
}
