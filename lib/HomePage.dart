// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/components/floatingSection.dart';
import 'package:todo/components/Notaskswidget.dart';
import 'package:todo/components/appbar.dart';
import 'package:todo/components/taskwidget.dart';

import 'package:todo/constants/colors.dart';
import 'package:todo/controllers/cubit/task_cubit.dart';

class Homepage extends StatelessWidget {
  final TextEditingController taskName = TextEditingController();
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlack,
      floatingActionButton: floatingsection(context,taskName),
      appBar: topbar(),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return state.tasksList.isEmpty
              ? notask(context)
              : taskwidget(context, state);
        },
      ),
    );
  }
}
