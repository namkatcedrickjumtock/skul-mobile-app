import 'package:flutter/material.dart';

class Announcements extends StatefulWidget {
  const Announcements({Key key}) : super(key: key);

  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Announcements'),
        ),
        body: Text('this is the news :)'));
  }
}
