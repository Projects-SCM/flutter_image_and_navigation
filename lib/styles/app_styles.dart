// This file will contain style optimization that you can use to save time coding
// specially when you need to reuse certain styles of text, labels, etc.

//Before working on ImageScreen, let's quickly add some text style that we can easily resuse

// begin by importing material.dart
import 'package:flutter/material.dart';

// Note this class is neither a Statefull or Stateless Widget
class AppStyles{

  // we will use this style for titles in the ImageScreen
  static const TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // we will use this style for subtitles
  // this code is saying, cpoy the style stored in titleStyle but
  // make the following changes to fontSize anad color.
  static TextStyle subtitleStyle = titleStyle.copyWith(
    fontSize:  12,
    color: Colors.grey,
  );
}