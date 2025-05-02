  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/components/chart.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/controllers/cubit/task_cubit.dart';

SingleChildScrollView taskwidget(BuildContext context, TaskState state) {
    return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    chart(context),
                    ListView.builder(
                      padding: EdgeInsets.only(bottom: 80),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.tasksList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(5),
                            minVerticalPadding: 5,
                            trailing: IconButton(
                              onPressed: () {
                                context.read<TaskCubit>().removeTask(
                                  state.tasksList[index].id,
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                                color: lightWhite,
                              ),
                            ),
                            leading: Checkbox(
                              checkColor: lightOrange,
                              fillColor: WidgetStateProperty.all(
                                Colors.white,
                              ),
                              value: state.tasksList[index].iscompleted,
                              onChanged: (value) {
                                context.read<TaskCubit>().toggleTask(
                                  state.tasksList[index].id,
                                );
                              },
                            ),
                            title: Text(
                              state.tasksList[index].title,
                              style: TextStyle(
                                color: lightWhite,
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                decoration:
                                    state.tasksList[index].iscompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                decorationColor: lightOrange,
                                decorationThickness: 5,
                              ),
                            ),
                            tileColor: Color(0xff2B2A27),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: darkOrange, width: 2),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
  }


