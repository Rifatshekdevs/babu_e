import 'dart:ui';
import 'package:agora_test/src/animation/animating_widget.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:agora_test/src/utils/loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'items.dart';
import 'dart:async';
import 'score_screen.dart';

class DragDropQuiz extends StatefulWidget {
  @override
  _DragDropQuizState createState() => _DragDropQuizState();
}

class _DragDropQuizState extends State<DragDropQuiz> {
  late Items items;
  PageController pageController = PageController();
  // AudioPlayer audioPlayer = AudioPlayer();
  // late String sound;
  late Item currentItem;
  int score = 0;
  bool isNotPressed = true;
  bool isNavigating = false;
  final dio = Dio();
  // final mcqList = <McqModel>[];

  // getMcq() async {
  //   var token = LocalStorage.getId();

  //   try {
  //     final response = await dio.get(ApiUrl.mcqCheck,
  //         options: Options(headers: {
  //           'content-type': 'application/json',
  //           'authorization': 'Bearer $token',
  //         }));
  //     // mmm(jsonEncode(response.data));
  //     ApiCaching().saveToLocal(ApiUrl.mcqCheck, jsonEncode(response.data));
  //     List<dynamic> body = response.data;
  //     var list = body.map((e) => McqModel.fromJson(e));
  //     mcqList.assignAll(list);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    // getMcq();
    items = Items();
    items.initialize();
    super.initState();

    // Future.delayed(
    //   Duration(milliseconds: 100),
    //   () {

    //   },
    // );
  }

  // play(String path) async {
  //   Audio.load(path)
  //     ..play()
  //     ..dispose();
  //   await audioPlayer.play();
  // }
  toNext() {
    if (isNavigating) return;
    //this line play sound
    isNavigating = true;
    // play(sound);
    isNotPressed = false;
    setState(() {});
    //this 4 second for delay 4 second
    Future.delayed(Duration(seconds: 2)).then((value) {
      if (pageController.page == items.items.length - 1) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ScoreScreen(
              score: score,
              items: items,
              name: 'Will be Given',
            ),
          ),
        );
      }
      pageController
          .nextPage(
              duration: Duration(milliseconds: 200), curve: Curves.easeOut)
          .then((value) {
        isNavigating = false;
        isNotPressed = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: KText(
          //   text: widget.subcategoryModel.name.toString(),
          //   fontFamily: kFontFamily,
          //   fontSize: 24,
          //   color: Colors.white,
          // ),
          centerTitle: true,
          iconTheme: IconThemeData(color: colorLightPurple),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          elevation: 0,
          backgroundColor: colorDarkPurple,
          actions: [
            TextButton(
                onPressed: () {
                  if (isNotPressed) {
                    isNotPressed = false;
                    toNext();
                  }
                },
                child: KText(
                    text: 'skip',
                    color: colorWhite,
                    fontFamily: sFontFamily,
                    fontSize: 22)),
          ],
        ),
        body: SafeArea(
          child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: items.items.length,
              itemBuilder: (context, index) {
                // sound = items.items[index].sound;
                currentItem = items.items[index];
                return EachPage(
                  onRightAns: () {
                    score += 10;
                    toNext();
                    print(score);
                  },
                  onWrongAns: () {
                    toNext();
                    print(score);
                  },
                  items: items,
                  index: index,
                  toNext: toNext,
                );
              }),
        ));
  }
}

class EachPage extends StatefulWidget {
  const EachPage({
    Key? key,
    required this.items,
    required this.index,
    required this.onRightAns,
    required this.onWrongAns,
    required this.toNext,
  }) : super(key: key);
  final VoidCallback toNext;
  final int index;
  final Items items;
  final VoidCallback onRightAns;
  final VoidCallback onWrongAns;
  @override
  State<EachPage> createState() => _EachPageState();
}

class _EachPageState extends State<EachPage> {
  double totalTime = 15;
  double currentTime = 0;
  bool isAnswered = false;
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    currentTime = totalTime;
    Future.delayed(Duration(milliseconds: 2000)).then((value) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (currentTime == 0) {
          timer.cancel();
          widget.toNext();
        } else {
          currentTime -= 1;
          setState(() {});
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LinearProgressIndicator(
            value: currentTime / totalTime,
            backgroundColor: Colors.amber,
            color: Colors.red,
          ),
        ),
        Text("$currentTime"),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: " ${widget.index + 1} /"), //1
              TextSpan(
                text: "${widget.items.items.length}", //4
                style: const TextStyle(fontSize: 18),
              ),
            ],
            style: const TextStyle(
              fontSize: 26,
              color: Color(0xFF3a3b6b),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                runAlignment: WrapAlignment.spaceEvenly,
                spacing: 30,
                runSpacing: 30,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.items.items[widget.index].options.map((word) {
                  int i = widget.items.items[widget.index].options
                      .indexWhere((e) => e == word);
                  // mmm(word + ' ' + i.toString());
                  return AnimatingWidget(
                    emptySpace: SizedBox(
                      height: 150,
                      width: 150,
                    ),
                    index: i,
                    scaleAnimationBegin: 1.3,
                    child: Option(
                      word: word,
                      rightAns: () {
                        // mmm(word);
                        // mmm('right');
                        if (isAnswered) return;
                        widget.onRightAns();
                        setState(() => isAnswered = true);
                      },
                      wrongAns: () {
                        // mmm(word);
                        // mmm('wrong');
                        if (isAnswered) return;
                        widget.onWrongAns();
                        setState(() => isAnswered = true);
                      },
                      currentTime: currentTime,
                      currentitem: widget.items.items[widget.index],
                    ),
                  );
                }).toList(),
              ),
               Spacer(
                flex: 2,
              ),
              isAnswered
                  ? SizedBox(
                      height: 120,
                      width: 120,
                      child: CachedNetworkImage(
                       imageUrl: widget.items.items[widget.index].image,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Draggable<Item>(
                      data: widget.items.items[widget.index],
                      feedback: SizedBox(
                        height: 120,
                        width: 120,
                        child: CachedNetworkImage(
                          imageUrl:widget.items.items[widget.index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: CachedNetworkImage(
                          imageUrl:widget.items.items[widget.index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      childWhenDragging: SizedBox(
                        height: 120,
                        width: 120,
                        child: CachedNetworkImage(
                         imageUrl: widget.items.items[widget.index].image,
                          fit: BoxFit.fill,
                          color: Colors.grey.withOpacity(0.2),
                          colorBlendMode: BlendMode.saturation,
                        ),
                      ),
                    ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Option extends StatefulWidget {
  const Option({
    Key? key,
    required this.word,
    required this.rightAns,
    required this.wrongAns,
    required this.currentitem,
    required this.currentTime,
  }) : super(key: key);
  final Item currentitem;
  final String word;
  final VoidCallback rightAns;
  final VoidCallback wrongAns;
  final double currentTime;
  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  Color color = Color(0xFFa4a3ef);
  @override
  Widget build(BuildContext context) {
    return DragTarget<Item>(
      onWillAccept: (item) {
        return true;
      },
      onAccept: (item) {
        mmm(item.word);
        mmm(widget.word);
        if (item.word == widget.word) {
          setState(() => color = Color(0xFF3b954a));
          widget.currentitem.rightAnswer();
          widget.rightAns();
        } else {
          setState(() => color = Color(0xFFb74330));
          widget.currentitem.wrongAnswer();
          widget.wrongAns();
        }

        //          toNext(sound);
      },
      builder: (context, candidate, rejects) {
        return Container(
          alignment: Alignment(0, 0),
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Text(widget.word,
              style: const TextStyle(fontSize: 22, color: Colors.white)),
        );
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
