import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hibmat/views/screens/lecturer_dashboard.dart';

import 'package:hibmat/views/screens/student_dashboard.dart';
import 'package:hibmat/views/components/background_img.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation1;
  Animation<double> _animation2;
  Animation<double> _animation3;

  bool _bool = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _animation2 = Tween<double>(begin: 0, end: .3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text('Options'),
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(child: CustomNavigationDrawer()),
    );
  }

  Widget CustomNavigationDrawer() {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width ,
      height: _width * 1.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTile(Icons.portrait, 'profile', () {
            HapticFeedback.lightImpact();
            Fluttertoast.showToast(
              msg: 'my profile',
            );
          }),
          MyTile(Icons.settings, 'settings', () {
            HapticFeedback.lightImpact();
            Fluttertoast.showToast(
              msg: 'settings',
            );
          }),
          MyTile(Icons.feedback_outlined, 'Feedback', () {
            HapticFeedback.lightImpact();
            Fluttertoast.showToast(
              msg: 'contact bcc',
            );
          }),
          MyTile(Icons.find_in_page_outlined, 'About', () {
            HapticFeedback.lightImpact();
            Fluttertoast.showToast(
              msg: 'about bcc',
            );
          }),
          SizedBox(
            height: _width * .40,
          ),
          Text(
            '\u00a9 bcc technologies Inc 2021',
            style: TextStyle(
              fontSize: _width * 0.04,
              color: Colors.blue[900],
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  // Widget BackgroundImage() {
  //   return SizedBox(
  //     height: MediaQuery.of(context).size.height,
  //     child: Image(
  //       image: AssetImage('assets/pictures/logo.jpg'),
  //       fit: BoxFit.fitHeight,
  //     ),
  //   );
  // }

  Widget MyTile(
    IconData icon,
    String title,
    VoidCallback voidCallback,
  ) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.white,
          leading: CircleAvatar(
            backgroundColor: Colors.blue[400],
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          onTap: voidCallback,
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: Colors.blue[400],
          ),
        ),
        
      ],
    );
  }

  
}
