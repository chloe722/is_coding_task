import 'package:flutter/material.dart';

const kCustomGreen = Color(0xFF04e1aa);
const kDarkGreen = Color(0xFF163b52);
const kFormFieldBgColor = Color(0xFFECEFF1);

const kCategoryTagTextStyle = TextStyle(
  color: kDarkGreen,
);

const kTitleTextStyle = TextStyle(
  color: kDarkGreen,
  fontSize: 16.0,
  fontWeight: FontWeight.bold
);

const kFormFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  border: OutlineInputBorder(
    borderRadius:  BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: kFormFieldBgColor,
  labelText: "",
  focusColor: kDarkGreen,
  hoverColor: kDarkGreen,
  labelStyle: TextStyle(color: kDarkGreen)
);


// Hard coded image for adding new bike item, because uploaded image feature is not implemented
const kBikeTempImage = "https://www.bikecraze.com/v/vspfiles/photos/1091091056-2.jpg?v-cache=1539322658";

