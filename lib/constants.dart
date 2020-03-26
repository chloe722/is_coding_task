import 'package:flutter/material.dart';

const kCustomGreen = Color(0xFF04e1aa);
const kDarkGreen = Color(0xFF163b52);
const kFormFieldBgColor = Color(0xFFECEFF1);

const kCategoryTagTextStyle = TextStyle(
  color: kDarkGreen,
);

const kTitleTextStyle = TextStyle(
  color: kDarkGreen,
  fontSize: 20.0,
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
  labelStyle: TextStyle(color: kDarkGreen, fontSize: 20.0)
);


const bikePlaceHolderImage = "https://images.internetstores.de/products//1066019/02/0af2f2/Cube_Touring_Hybrid_EXC_500_Trapez_iridium_n_green[640x480].jpg?forceSize=true&forceAspectRatio=true&useTrim=true";