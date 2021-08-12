import 'package:flutter/material.dart';
import 'package:flutter_app/color.dart';
import 'package:flutter_app/index.dart';

void main() {
  runApp(MaterialApp(
    //using debugShowCheckedModeBanner makes slow moving app cause of flutter diagnostics
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primary

    ),
    home: IndexPage(),
  ));
}
