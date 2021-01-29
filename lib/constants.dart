import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  hintText: 'Enter value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 3.0),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 5.0, color: Colors.greenAccent),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);

const kURL =
    'http://{ENTER IP ADDRESS ON WHICH FLASK SERVER IS RUNNING}/api'; //MAKE THIS CHANGE BEFORE RUNNING
