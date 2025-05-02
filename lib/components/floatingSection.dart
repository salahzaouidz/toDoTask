// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/components/textfiled.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/controllers/cubit/task_cubit.dart';

Row floatingsection(BuildContext context,TextEditingController taskName) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 10),
            child: Textfiled(taskName: taskName),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            if (taskName.text.isEmpty) return;
            context.read<TaskCubit>().addTask(taskName.text);
            taskName.clear();
            FocusScope.of(context).unfocus();
          },
          backgroundColor: Color.fromARGB(255, 16, 16, 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: lightOrange, width: 2),
          ),
          child: Icon(Icons.add, color: lightOrange, size: 30),
        ),
      ],
    );
  }