// To parse this JSON data, do
//
//     final advanceExam = advanceExamFromJson(jsonString);


import 'dart:convert';

import 'package:agora_test/src/utils/constrants.dart';

List<AdvanceExam> advanceExamFromJson(String str) => List<AdvanceExam>.from(
    json.decode(str).map((x) => AdvanceExam.fromJson(x)));

// String advanceExamToJson(List<AdvanceExam> data) =>
// json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvanceExam {
  AdvanceExam({
    required this.id,
    required this.option,
    required this.image,
    required this.name,
    required this.subcategory,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  List<String> option;
  String image;
  String name;
  String subcategory;
  int level;
  String createdAt;
  String updatedAt;
  int v;

  factory AdvanceExam.fromJson(Map<String, dynamic> json) => AdvanceExam(
        id: json["_id"] == null ? null : json["_id"],
        option: json["option"] == null
            ? []
            : List<String>.from(json["option"].map((x) => x)),
        image: json["image"] == null ? placeHolderImage : json["image"],
        name: json["name"] == null ? 'Unknown' : json["name"],
        subcategory: json["subcategory"] == null ? null : json["subcategory"],
        level: json["level"] == null ? null : json["level"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        v: json["__v"] == null ? null : json["__v"],
      );
}
