import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';

AppBar topbar() {
    return AppBar(
      title: Text('ToDo App'),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: lightOrange,
        fontSize: 25,
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: darkBlack,
      foregroundColor: lightOrange,
      shadowColor: Colors.white,
      elevation: 1,
    );
  }