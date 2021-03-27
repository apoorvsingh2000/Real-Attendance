import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const green = Color(0xff038E70);
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

const kHeadingTextStyle = TextStyle(fontSize: 20.0);
const kEntryTextStyle = TextStyle(fontSize: 15.0);

const kSendButtonTextStyle = TextStyle(
  color: green,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xff013C38), width: 2.0),
  ),
);

const kLoginTextFieldInputDecoration = InputDecoration(
  hintText: 'Enter your password.',
  fillColor: Colors.white60,
  filled: true,
  hintStyle: TextStyle(color: Colors.black54),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: green, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: green, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
