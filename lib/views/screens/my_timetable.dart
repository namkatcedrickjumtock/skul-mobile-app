import 'package:flutter/material.dart';

class MyTimetable extends StatefulWidget {
  const MyTimetable({Key key}) : super(key: key);

  @override
  _MyTimetableState createState() => _MyTimetableState();
}

class _MyTimetableState extends State<MyTimetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('My timetable'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              child: Table(
                // defaultColumnWidth: FixedColumnWidth(120.0),
                border: TableBorder.all(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                children: [
                  TableRow(children: [
                    Text('D/T'),
                    Text('7:00'),
                    Text('9:00'),
                    Text('11:00'),
                    Text('13:00'),
                    Text('15:00'),
                    Text('17:00'),
                  ]),
                  TableRow(children: [
                    Text('Mon'),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Text('Tues'),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Text('Wed'),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Text('Thur'),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Text('Fri'),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Text('Sat'),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Text('Sun'),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
