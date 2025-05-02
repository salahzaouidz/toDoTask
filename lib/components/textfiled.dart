import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Textfiled extends StatelessWidget {
   TextEditingController taskName = TextEditingController();
  Textfiled({super.key,required this.taskName});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: taskName,
      style: TextStyle(
        color: Color(0xffF0E3CA),
        fontSize: 18,
        fontFamily: 'Ubuntu',
      ),
      decoration: InputDecoration(
        fillColor: Color(0xff2B2A27),
        filled: true,
        enabledBorder: OutlineInputBorder(
          //borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xffA35709), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xffFF8303), width: 2),
        ),
        hintText: 'Enter your TaskName..',
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 129, 129, 129),
          fontSize: 18,
          fontFamily: 'Ubuntu',
        ),
      ),
    );
  }
}
