import 'package:flutter/material.dart';

class MyResults extends StatefulWidget {
  const MyResults({Key key}) : super(key: key);

  @override
  _MyResultsState createState() => _MyResultsState();
}

class _MyResultsState extends State<MyResults> {
  final department = 'Computer Engineering';
  final option = 'SWE';
  final matriculation = 'hibmat/2021/ce/2322';
  final studentName = 'Demo Student';
  final level = '400';
  final examType = 'Semester 2';
  final gpa = '3.1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Results'),
      ),
      body: ListView(
        children: [
          Text('Department: $department'),
          Text('Option: $option'),
          Text('Mat: $matriculation'),
          Text('Name: $studentName'),
          Text('Level: $level'),
          Text('type: $examType'),
          Column(
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
                      Text('s/n'),
                      Text('Title'),
                      Text('CA /30'),
                      Text('Exam /70'),
                      Text('Total /100'),
                      Text('Grade'),
                      Text('Remark'),
                    ]),
                    TableRow(children: [
                      Text('1'),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                    ]),
                    TableRow(children: [
                      Text('2'),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                    ]),
                    TableRow(children: [
                      Text('3'),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                    ]),
                    TableRow(children: [
                      Text('4'),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                    ]),
                    TableRow(children: [
                      Text('5'),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                    ]),
                    TableRow(children: [
                      Text('6'),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                      Text(''),
                    ]),
                    TableRow(children: [
                      Text('7'),
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
          Row(
            children: [
              Text('No CA written: '),
              Text('No CA Missed:'),
            ],
          ),
          Row(
            children: [
              Text('No EXam written: '),
              Text('No EXam Missed: '),
            ],
          ),
          Text('GPA: $gpa'),
        ],
      ),
    );
  }
}