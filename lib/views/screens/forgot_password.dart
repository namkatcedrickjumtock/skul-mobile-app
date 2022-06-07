import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:hibmat/views/screens/sign_in.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot password',
          style: TextStyle(
            color: Colors.white,
            fontSize: _width * .05,
          ),
        ),
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            _width * .1, _height * .1, _width * .1, _height * .1),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: _width * .045,
                    fontWeight: FontWeight.w400),
                textAlignVertical: TextAlignVertical.bottom,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: Colors.grey[800],
                  ),
                  hintText: 'Email...',
                  hintStyle:
                      TextStyle(color: Colors.black54, fontSize: _width * .045),
                  hintMaxLines: 1,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: _width * .05,
            ),
            Text(
              'Make sure to enter the email address you used to created your HIBMAT account with.\nIntructions on how to reset your password will be sent to your email',
              style: TextStyle(
                  height: 1.4,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: _width * .045),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: _width * .08,
            ),
            Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: RichText(
                  text: TextSpan(
                    text: 'Get Link',
                    style: TextStyle(color: Colors.blue[900]),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'reset link sent',
                        );
                        // Navigator.pop(context, '/forgotPassword');
                        Navigator.pop(context);
                        // Navigator.pushNamed(context, '/signIn');
                      },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
