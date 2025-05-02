import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/HomePage.dart';
import 'package:todo/controllers/cubit/task_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      home: BlocProvider(
        create: (context) => TaskCubit(),
        child: Homepage(),
      ),
    );
  }
}

