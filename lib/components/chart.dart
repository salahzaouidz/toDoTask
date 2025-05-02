import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/controllers/cubit/task_cubit.dart';

PieChart chart(BuildContext context) {
  return PieChart(
                    dataMap: {
                      "Done": context.read<TaskCubit>().getCompletedTasks(),

                      "Not Done":
                          context.read<TaskCubit>().getInCompletedTasks(),
                    },
                    animationDuration: Duration(milliseconds: 800),
                    chartRadius: 170,
                    colorList: [lightOrange, Colors.grey],
                    chartType: ChartType.ring,
                    ringStrokeWidth: 50,
                    chartLegendSpacing: 40,
                    legendOptions: LegendOptions(
                      showLegends: true,
                      legendPosition: LegendPosition.bottom,
                      legendTextStyle: TextStyle(
                        fontSize: 20,
                        color: lightWhite,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValuesInPercentage: true,
                      showChartValues: true,
                      chartValueStyle: TextStyle(
                        color: darkBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  );
}