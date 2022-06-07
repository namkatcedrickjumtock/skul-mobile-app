import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hibmat/views/screens/forgot_password.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  final _lfKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: .7, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )
      ..addListener(
        () {
          setState(() {});
        },
      )
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      );

    _controller.forward();
  }

  String email;
  String pwd;
  bool _ishidden = true;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> logStudent() async {
    var act = "logStd";
    String url =
        "https://hibmat-software.000webhostapp.com/Models/Students.class.php";
    var data = {
      "LogStudent": act,
      "mail": email,
      "pwd": pwd,
    };

    http.Response response = await http.post(Uri.parse(url),
        body: data, headers: {"Accept": "application/json"});

    print(response.body);
    if (jsonDecode(response.body) == "verified") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("welcome...."),
        backgroundColor: Colors.green,
      ));
      Navigator.pop(context);
      Navigator.pushNamed(context, '/studentDashboard');
    } 
    // else if (jsonDecode(response.body) == "pwd_error") {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       backgroundColor: Colors.red,
    //       content: TextButton.icon(
    //         onPressed: () {},
    //         icon: Icon(Icons.lock_outline),
    //         label: Text("password not correct",
    //             style: TextStyle(
    //               color: Colors.black,
    //             )),
    //       )));
    // } 
    // else if (jsonDecode(response.body) == "not_exists") {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       backgroundColor: Colors.red,
    //       content: Text(
    //         "Account Doesn't exists",
    //         style: TextStyle(
    //           color: Colors.black,
    //         ),
    //       )));
    // } 
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Somethin went wrong please try again",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    bool isSwitched = false;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey[100], Colors.red[50], Colors.white],
                begin: Alignment.bottomCenter,
                stops: [0.05, 0.3, 1],
                end: Alignment.topCenter)),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: _height * .2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _width * .3,
                width: _width * .4,
                child: Center(
                  child: Image(
                      image: AssetImage('assets/pictures/logo.jpg'),
                      fit: BoxFit.fitHeight),
                ),
              ),
              SizedBox(
                height: _height * .03,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Form(
                    key: _lfKey,
                    child: Column(
                      children: [
                        SizedBox(height: _height * 0.01),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onChanged: (val) => email = val,
                          decoration: InputDecoration(
                            labelText: "email",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.mail_outline),
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return " please enter valid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: _height * .05),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onChanged: (val) => pwd = val,
                          obscureText: _ishidden,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    _ishidden = !_ishidden;
                                  },
                                );
                              },
                              child: Icon(_ishidden
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                            ),
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return " please enter value";
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
              ),
              SizedBox(height: _height * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Forgotten password!',
                      style: TextStyle(
                        color: Colors.blue[900],
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          HapticFeedback.lightImpact();
                          Fluttertoast.showToast(msg: 'Forgotten password!');
                          Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ForgotPassword()));
                        },
                    ),
                  ),
                  SizedBox(width: _width / 10),
                  RichText(
                    text: TextSpan(
                      text: 'Create a new Account',
                      style: TextStyle(color: Colors.blue[900]),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          HapticFeedback.lightImpact();
                          Fluttertoast.showToast(
                            msg: 'Create a new Account button pressed',
                          );
                          Navigator.pop(context, '/signIn');
                          Navigator.pushNamed(context, "/createAccount");
                        },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    RichText(
                      text: TextSpan(
                        text: 'save login',
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (val) {
                        setState(() {
                          isSwitched = val;
                          print(isSwitched);
                        });
                      },
                    ),
                  ]),
                  SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          child: Transform.scale(
                            scale: _animation.value,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                HapticFeedback.lightImpact();
                                if (_lfKey.currentState.validate()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Authenticating...."),
                                    backgroundColor: Colors.black,
                                  ));
                                  logStudent();
                                }
                              },
                              child: Container(
                                height: _width * .2,
                                width: _width * .2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  'SIGN-IN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
