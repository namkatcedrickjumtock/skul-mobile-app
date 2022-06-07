import 'package:flutter/material.dart';

class Complaints extends StatefulWidget {
  const Complaints({ Key key }) : super(key: key);

  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complaints'),),
      body:Text('what is your complain?')
    );
  }
}