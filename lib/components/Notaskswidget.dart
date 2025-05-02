// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';

SingleChildScrollView notask(BuildContext context) {
    return SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4,
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/photos/task1.png', height: 300),
                      Text(
                        'There is no Tasks yet!',
                        style: TextStyle(
                          color: lightWhite,
                          fontSize: 20,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
