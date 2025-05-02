import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/task_model.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial()) {
    loadTasks();
  }

  // Add task
  addTask(String taskName) async {
    TaskModel task = TaskModel(
      id: Uuid().v1(),
      iscompleted: false,
      title: taskName,
    );

    final updatedList = [...state.tasksList, task];
    emit(TaskUpdate(updatedList));
    await saveTasks(updatedList);
  }

  // Remove task
  removeTask(String id) async {
    List<TaskModel> newList =
        state.tasksList.where((task) => task.id != id).toList();
    emit(TaskUpdate(newList));
    await saveTasks(newList);
  }

  toggleTask(String id) async {
    List<TaskModel> newList =
        state.tasksList.map((task) {
          return task.id == id
              ? task.copyWith(iscompleted: !task.iscompleted)
              : task;
        }).toList();
    emit(TaskUpdate(newList));
    await saveTasks(newList);
  }

  double getCompletedTasks() {
    List<TaskModel> newList =
        state.tasksList.where((task) => task.iscompleted == true).toList();
    return newList.length.toDouble();
  }

  double getInCompletedTasks() {
    List<TaskModel> newList =
        state.tasksList.where((task) => task.iscompleted == false).toList();
    return newList.length.toDouble();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = jsonEncode(tasks.map((e) => e.toJson()).toList());
    await prefs.setString('tasks', tasksJson);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final List decoded = jsonDecode(tasksJson);
      emit(TaskUpdate(decoded.map((e) => TaskModel.fromJson(e)).toList()));
    }
  }
}
