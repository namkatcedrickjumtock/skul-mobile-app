import 'package:flutter/material.dart';

class AboutHibmat extends StatelessWidget {
  const AboutHibmat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height  = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('What is HIBMAT all about'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Text('welcome to HIBMAT :)'),
      ),
    );
  }
}
