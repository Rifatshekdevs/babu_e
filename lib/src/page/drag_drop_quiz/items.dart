import 'dart:convert';
import 'dart:math';

import 'package:agora_test/src/api_caching/api_cache.dart';
import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/model/mcq_model.dart';
import 'package:get/get.dart';

enum AnswerState { right, wrong, nothing }

class Items {
  List<Item> items = [];
  final mcqList = <McqModel>[];
  initialize() {
    String response = ApiCaching().getFromLocal(ApiUrl.mcqCheck);
    if (response == '') {
      Get.snackbar('Error', 'No data found');
      return;
    }
    List<dynamic> body = jsonDecode(response);
    var list = body.map((e) => McqModel.fromJson(e));
    mcqList.assignAll(list);
    List<Item> _items = [];
    for (int i = 0; i < 4; i++) {
      List<String> l = [];

      l.add(mcqList[i].option1!);

      l.add(mcqList[i].option2!);

      l.add(mcqList[i].option3!);

      l.add(mcqList[i].option4!);

      Item ie = Item(i, mcqList[i], l);
      ie.initialize();
      _items.add(ie);
    }
    _items.shuffle();
    items = _items;
  }
}

class Item {
  AnswerState answerState = AnswerState.nothing;
  int index;
  McqModel mcqModel;
  List<String> words;
  Item(this.index, this.mcqModel, this.words);
  String get word => mcqModel.name!;
  String get image => mcqModel.image!;
  String get sound => '';
  List<String> options = [];

  initialize() {
    Random rand = Random();
    List l = [];
    if (mcqModel.option1 != null) {
      l.add(mcqModel.option1);
    }
    if (mcqModel.option2 != null) {
      l.add(mcqModel.option2);
    }
    if (mcqModel.option3 != null) {
      l.add(mcqModel.option3);
    }
    if (mcqModel.option4 != null) {
      l.add(mcqModel.option4);
    }

    l.remove(word);
    String op1 = l[rand.nextInt(2)];
    l.remove(op1);
    String op2 = l[rand.nextInt(1)];
    l.remove(op2);
    String op3 = l[0];
    List<String> listOfOp = [word, op1, op2, op3];
    listOfOp.shuffle();
    options = listOfOp;
  }

  rightAnswer() {
    answerState = AnswerState.right;
  }

  wrongAnswer() {
    answerState = AnswerState.wrong;
  }
}

// List words = [
//   "Lili",
//   "Lotus",
//   "Rose",
//   "Sunflower",
// ];
