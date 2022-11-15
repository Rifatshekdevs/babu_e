// ignore_for_file: prefer_const_constructor, unused_local_variable, prefer_const_constructors, avoid_function_literals_in_foreach_calls, prefer_const_literals_to_create_immutables


import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/utils/back_button.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_chart/pie_chart.dart';
import 'check_solution.dart';
import 'highscore_screen.dart';
import 'items.dart';
import 'leaderboard.dart';
import 'report_screen.dart';

class ScoreScreen extends StatefulWidget {
  final String name;
  final int score;
  final Items items;
  const ScoreScreen({
    Key? key,
    required this.score,
    required this.items,
    required this.name,
  }) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
//  Box<PlayerScore> scoreBox = Hive.box<PlayerScore>(SCORE_BOXS);

  @override
  void initState() {
    var date = DateTime.now();
    int year = date.year;
    int month = date.month;
    int day = date.day;
    String hour =
        "${date.hour > 11 ? date.hour - 12 : date.hour}${date.hour > 11 ? "pm" : "am"}";
    String dateOfPlaying = "$year-${months[month - 1]}-$day-$hour";

    // scoreBox.put(
    //     widget.name,
    //     PlayerScore(
    //         name: widget.name,
    //         score: widget.score,
    //         examNumber: widget.items.items.length * 10,
    //         date: dateOfPlaying));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EDEDED'),
      appBar: AppBar(
          title: KText(
            text: 'Score Screen',
            fontFamily: sFontFamily,
            fontSize: 24,
            color: Colors.white,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: colorLightPurple),
          leading: MainXackButton(
            bgCol: colorDarkPurple,
            iconCol: Colors.white,
          ),
          elevation: 0,
          backgroundColor: colorDarkPurple),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: rgPadding,
              ),
              DefaultTextStyle(
                style: TextStyle(color: Colors.black),
                child: PieChart(
                  dataMap: {
                    "Right": rightAnsCount(),
                    "Skip": skipCount(),
                    "Wrong": wrongAnsCount(),
                  },
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 2.2,
                  colorList: [Colors.green, Colors.tealAccent, Colors.red],
                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 32,
                  centerText:
                      "Score ${widget.score}/${widget.items.items.length * 10}",
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.bottom,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(fontFamily: sFontFamily),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: MaterialButton(
                    height: constraints.maxHeight * 0.1,
                    minWidth: constraints.maxWidth * 0.6,
                    color: colorLightPurple,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CheckSolution(
                            items: widget.items,
                          ),
                        ),
                      );
                    },
                    child: KText(
                      text: 'Check Solution',
                      color: colorWhite,
                      fontFamily: sFontFamily,
                      fontSize: 22,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      height: constraints.maxHeight * 0.1,
                      minWidth: constraints.maxWidth * 0.4,
                      color: colorLightPurple,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LeaderBoard(
                              items: widget.items,
                            ),
                          ),
                        );
                      },
                      child: KText(
                        text: 'LeaderBoard',
                        color: colorWhite,
                        fontFamily: sFontFamily,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      height: constraints.maxHeight * 0.1,
                      minWidth: constraints.maxWidth * 0.4,
                      color: colorLightPurple,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HighScoreScreen(),
                          ),
                        );
                      },
                      child: KText(
                        text: 'Heigh Scores',
                        color: colorWhite,
                        fontFamily: sFontFamily,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      height: constraints.maxHeight * 0.1,
                      minWidth: constraints.maxWidth * 0.4,
                      color: colorLightPurple,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ReportScreen(
                              items: widget.items,
                            ),
                          ),
                        );
                      },
                      child: KText(
                        text: 'Report',
                        color: colorWhite,
                        fontFamily: sFontFamily,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      height: constraints.maxHeight * 0.1,
                      minWidth: constraints.maxWidth * 0.4,
                      color: colorLightPurple,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: KText(
                        text: 'Home',
                        color: colorWhite,
                        fontFamily: sFontFamily,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
              Container(),
            ],
          );
        }),
      ),
    );
  }

  double percentageRightAns(Items items, int score) {
    double total = items.items.length.toDouble();
    double right = score / 10;

    return (right / total);
  }

  double rightAnsCount() {
    double i = 0;
    widget.items.items.forEach((element) {
      if (element.answerState == AnswerState.right) {
        i++;
      }
    });
    return i;
  }

  double wrongAnsCount() {
    double i = 0;
    widget.items.items.forEach((element) {
      if (element.answerState == AnswerState.wrong) {
        i++;
      }
    });
    return i;
  }

  double skipCount() {
    double i = 0;
    widget.items.items.forEach((element) {
      if (element.answerState == AnswerState.nothing) {
        i++;
      }
    });
    return i;
  }
}

const List months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];
