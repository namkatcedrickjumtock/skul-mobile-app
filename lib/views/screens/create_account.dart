// import 'dart:html';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
// variables
  String name;
  String email;
  String tel;
  String password;
  String cnfrmPwd;
  bool _isHidden = true;
  final _fkey = GlobalKey<FormState>();

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey[100], Colors.red[50], Colors.white],
                begin: Alignment.bottomCenter,
                stops: [0.05, 00.05, 1],
                end: Alignment.topCenter)),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: _height * .15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _width * .4,
                width: _width * .4,
                child: Image(
                    image: AssetImage('assets/pictures/logo.jpg'),
                    fit: BoxFit.fitHeight),
              ),
              SizedBox(
                  // height: _height * 0.05,
                  ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
                child: Form(
                  key: _fkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          name = val;
                          print(name);
                        },
                        decoration: InputDecoration(
                          labelText: "name",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter value";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: _height * 0.01),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          email = val;
                          print(email);
                        },
                        decoration: InputDecoration(
                          labelText: "email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.mail_outline),
                        ),
                        validator: (val) {
                          if (val.isEmpty) {
                            return " please enter valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: _height * 0.01),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          tel = val;
                          print(tel);
                        },
                        decoration: InputDecoration(
                          labelText: "Telephone",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone_android_outlined),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "please enter valid number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: _height * 0.01),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          password = val;
                          print(password);
                        },
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                            labelText: "password",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            suffixIcon: InkWell(
                              onTap: () => _togglePasswordView(),
                              child: Icon(_isHidden
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                            )),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "please enter valid password";
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: _height * 0.02),
              RichText(
                text: TextSpan(
                  text: 'Already have an Account',
                  style: TextStyle(color: Colors.blue[900]),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      HapticFeedback.lightImpact();
                      Fluttertoast.showToast(
                        msg: 'redirecting to sign in page',
                      );
                      Navigator.pop(context, '/createAccount');
                      Navigator.pushNamed(context, '/signIn');
                    },
                ),
              ),
              SizedBox(height: _height * .0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('By Signing up, I agree to the '),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'terms of service?',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            HapticFeedback.lightImpact();
                            Fluttertoast.showToast(
                                msg: 'view terms and services');
                          },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _height * .02,
              ),
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
                            if (_fkey.currentState.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Creating Account...",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.black
                              ));
                              creatStudent();
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
                              'CREATE',
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
        ),
      ),
    );
  }

  // signup Async function

  Future<void> creatStudent() async {
    var act = "createStudent";
    String url =
        "https://hibmat-software.000webhostapp.com/Models/Students.class.php";
    var data = {
      "createStudent": act,
      "name": name,
      "mail": email,
      "tel": tel,
      "pwd": password
    };

    http.Response response = await http.post(Uri.parse(url),
        body: data, headers: {"Accept": "application/json"});

    print(response.body);
    if (jsonDecode(response.body) == "inserted") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Account created, Now Login"),
        backgroundColor: Colors.green,
      ));
      Navigator.pop(context);
      Navigator.pushNamed(context, '/signIn');
    } else if (jsonDecode(response.body) == "taken") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Email Already taken use another Email",
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Somethin went wrong please try again",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }
}
