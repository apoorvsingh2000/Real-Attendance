import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winhacks_21/utilities/constants.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String mEmail, mPassword;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xff036E70),
              Color(0xff038E70),
              Color(0xff005246),
              Color(0xff038E70),
              Color(0xff005246),
            ])),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/att.jpeg'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Center(
                child: TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 500),
                  text: ['Winhacks'],
                  textStyle: GoogleFonts.k2d(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white60),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  mEmail = value;
                },
                decoration: kLoginTextFieldInputDecoration.copyWith(
                    hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  mPassword = value;
                },
                decoration: kLoginTextFieldInputDecoration.copyWith(
                    hintText: 'Enter your password.'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), color: Colors.black54),
                child: FlatButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser =
                            await _firebaseAuth.signInWithEmailAndPassword(
                                email: mEmail, password: mPassword);
                        if (newUser != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => HomeScreen()));
                        }
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.white60, fontSize: 20.0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
