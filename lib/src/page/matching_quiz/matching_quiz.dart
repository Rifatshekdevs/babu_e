// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:math';
import 'package:agora_test/src/api_caching/api_cache.dart';
import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/model/advanced_question.dart';
import 'package:agora_test/src/page/drag_drop_quiz/items.dart';
import 'package:agora_test/src/page/drag_drop_quiz/score_screen.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchingQuizItems {
  List<MatchingQuizItem> items = [
    // MatchingQuizItem(
    //   answer: "ROSE",
    //   imgPath: "assets/flowers/Rose.svg",
    //   question: "What is the flower?",
    // ),
    // MatchingQuizItem(
    //   answer: "ROSE",
    //   imgPath: "assets/flowers/Rose.svg",
    //   question: "What is the flower?",
    // ),
    // MatchingQuizItem(
    //   answer: "LOTUS",
    //   imgPath: "assets/flowers/Lotus.svg",
    //   question: "What is the flower?",
    // ),
  ];

  initiate() {
    String response = ApiCaching().getFromLocal(ApiUrl.advanceMcq);
    if (response != '') {
      // mmm('from local');
      // mmm(response);
      // mmm('from local');
      final advanceExam = advanceExamFromJson(response);
      for (int i = 0; i < advanceExam.length; i++) {
        items.add(MatchingQuizItem(
          answer: advanceExam[i].name,
          imgPath: advanceExam[i].image,
          question: "What is this?",
        ));
      }
    }
  }
}

class MatchingQuizItem {
  String question;
  String imgPath;
  String answer;
  MatchingQuizItem({
    required this.answer,
    required this.imgPath,
    required this.question,
  });
  List<String> options() {
    List<String> _options = [];
    _options = answer.split('');
    List<String> alphabets = [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z",
    ];
    _options.add(alphabets[Random().nextInt(23)]);
    _options.add(alphabets[Random().nextInt(23)]);
    _options.add(alphabets[Random().nextInt(23)]);
    _options.shuffle();
    return _options;
  }
}

class MatchingQuiz extends StatefulWidget {
  const MatchingQuiz({Key? key}) : super(key: key);

  @override
  _MatchingQuizState createState() => _MatchingQuizState();
}

class _MatchingQuizState extends State<MatchingQuiz>
    with SingleTickerProviderStateMixin {
  late MatchingQuizItems matchingQuizItems = MatchingQuizItems();
  PageController pageController = PageController();
  int score = 0;
  late List<MatchingQuizItem> items;
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 15,
      ),
    );
    animation = Tween(begin: 1.0, end: 0.0).animate(animationController);

    matchingQuizItems.initiate();
    items = matchingQuizItems.items;
    animationController.reset();
    animationController.forward();
    super.initState();
  }

  toNext() {
    if (pageController.page! < items.length - 1) {
      pageController
          .nextPage(
              duration: Duration(milliseconds: 200), curve: Curves.easeOut)
          .then((value) {
        animationController.reset();
        animationController.forward();
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ScoreScreen(
            score: score,
            items: Items(),
            name: 'Will be Given',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: colorDarkPurple,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              if (animation.value == 0) {
                Future.delayed(Duration(milliseconds: 200), toNext);
              }
              return Row(
                children: [
                  Container(
                      height: 10,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        color: Color(0xFF67b9e5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 10,
                            width: width * 0.6 * animation.value,
                            decoration: BoxDecoration(
                              color: Color(0xFF24305b),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      )),
                  Text(
                    "${(15 * animation.value).round()} s",
                    style: TextStyle(
                      color: Color(0xFF24305b),
                    ),
                  ),
                ],
              );
            }),
      ),
      body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return MatchingQuizPage(
              matchingQuizItem: items[index],
              pageIndex: index,
              toNext: toNext,
            );
          }),
    );
  }
}

class MatchingQuizPage extends StatefulWidget {
  const MatchingQuizPage({
    Key? key,
    required this.matchingQuizItem,
    required this.pageIndex,
    required this.toNext,
  }) : super(key: key);
  final MatchingQuizItem matchingQuizItem;
  final int pageIndex;
  final Function toNext;
  @override
  State<MatchingQuizPage> createState() => _MatchingQuizPageState();
}

class _MatchingQuizPageState extends State<MatchingQuizPage> {
  late List<String> options;
  late String question;
  late String answer;
  late String imgPath;
  List<DecoratedLetter> word = [];

  @override
  void initState() {
    question = widget.matchingQuizItem.question;
    answer = widget.matchingQuizItem.answer;
    imgPath = widget.matchingQuizItem.imgPath;
    options = widget.matchingQuizItem.options();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 6,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${widget.pageIndex + 1}.",
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF5c5bbe),
                  // fontFamily: kFontFamily,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                question,
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF5c5bbe),
                  // fontFamily: kFontFamily,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  spreadRadius: 4,
                ),
              ],
              color: Color(0xFFffffff),
            ),
            height: height * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CachedNetworkImage(
              imageUrl:imgPath,
                  height: height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: word,
                ),
              ],
            ),
          ),
          Wrap(children: [
            ...options
                .map(
                  (e) => Button(
                    letter: e,
                    word: word,
                    setState: setState,
                    onTap: () {
                      String _word = "";
                      for (var letter in word) {
                        _word += letter.letter;
                      }
                      if (_word == answer) {
                        widget.toNext();
                        setState(() {});
                      }
                    },
                  ),
                )
                .toList(),
            Button(
              letter: "\u2612",
              word: word,
              setState: setState,
              onTap: () {},
            )
          ]),
          // InkWell(
          //   onTap: () {
          //     widget.toNext();
          //   },
          //   child: Container(
          //     alignment: Alignment.center,
          //     width: double.infinity,
          //     height: height * 0.08,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       color: Color(0xFFdc9c3f),
          //     ),
          //     child: Text(
          //       "Next",
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class DecoratedLetter extends StatelessWidget {
  const DecoratedLetter(
    this.letter, {
    Key? key,
    required this.color,
  }) : super(key: key);
  final String letter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Text(
            letter,
            style: TextStyle(
              color: color,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              // fontFamily: kFontFamily,
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(2),
                height: 3,
                width: 3,
                color: color,
              ),
              Container(
                margin: EdgeInsets.all(2),
                height: 3,
                width: 3,
                color: color,
              ),
              Container(
                margin: EdgeInsets.all(2),
                height: 3,
                width: 3,
                color: color,
              ),
              Container(
                margin: EdgeInsets.all(2),
                height: 3,
                width: 3,
                color: color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Color> colors = [
  Color(0xFFcfba53),
  Color(0xFFafcf53),
  Color(0xFF53cf9f),
  Color(0xFF5392cf),
  Color(0xFF5c5bbe),
  Color(0xFF935bbe),
  Color(0xFFbe5ba7),
];

class Button extends StatefulWidget {
  final String letter;
  List<DecoratedLetter> word;
  final VoidCallback onTap;
  void Function(void Function()) setState;
  Button({
    Key? key,
    required this.letter,
    required this.word,
    required this.setState,
    required this.onTap,
  }) : super(key: key);
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late Color color;

  @override
  void initState() {
    color = colors[Random().nextInt(colors.length - 1)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (widget.letter == "\u2612") {
            widget.word.removeLast();
            widget.setState(() {});
          } else {
            widget.word.add(DecoratedLetter(widget.letter, color: color));
            widget.setState(() {});
          }
          widget.onTap();
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(10),
          dashPattern: [3, 3],
          child: Container(
            alignment: Alignment(0, 0),
            height: size.height * 0.07,
            width: size.height * 0.07,
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  6.0,
                ),
                color: color),
            child: Text(
              widget.letter,
              style: TextStyle(
                fontSize: 35 * size.height / 713,
                color: Color(0xFFFFFFFF),
                // fontFamily: kFontFamily
              ),
            ),
          ),
        ),
      ),
    );
  }
}
