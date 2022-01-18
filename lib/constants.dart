import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const KTextField=InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    fontSize: 17,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2,
    ),
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2,
    ),
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  ),
  filled: true,
  fillColor: Colors.purple,
  contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
);
