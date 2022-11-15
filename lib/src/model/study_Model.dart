// To parse this JSON data, do
//
//     final studyModel = studyModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:agora_test/src/utils/constrants.dart';

class StudyModel {
    StudyModel({
        required this.id,
        required this.name,
        required this.showName,
        required this.description,
        required this.images,
        required this.audio,
        required this.poem,
        required this.subcategory,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.image,
    });

    String id;
    String name;
    bool showName;
    String description;
    List<String> images;
    String audio;
    List<String> poem;
    Subcategory subcategory;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String image;
    bool isSelected= false;

    factory StudyModel.fromRawJson(String str) => StudyModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StudyModel.fromJson(Map<String, dynamic> json) => StudyModel(
        id: json["_id"],
        name: json["name"]==null?"Unknown Name":json["name"],
        showName: json["showName"],
        description: json["description"]==null?"Unknown description":json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        audio: json["audio"] == null ? "null" : json["audio"],
        poem: List<String>.from(json["poem"].map((x) => x)),
        subcategory: Subcategory.fromJson(json["subcategory"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        image: json["image"] == null ? placeHolderImage : json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "showName": showName,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "audio": audio == null ? "null" : audio,
        "poem": List<dynamic>.from(poem.map((x) => x)),
        "subcategory": subcategory.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "image": image == null ? placeHolderImage: image,
    };
}

class Subcategory {
    Subcategory({
       required this.id,
       required this.name,
       required this.frontImage,
       required this.backImage,
       required this.membership,
       required this.layout,
       required this.position,
       required this.category,
       required this.createdBy,
       required this.v,
    });

    String id;
    String name;
    String frontImage;
    String backImage;
    String membership;
    String layout;
    int position;
    String category;
    String createdBy;
    int v;

    factory Subcategory.fromRawJson(String str) => Subcategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["_id"],
        name: json["name"],
        frontImage: json["frontImage"],
        backImage: json["backImage"],
        membership: json["membership"],
        layout: json["layout"],
        position: json["position"],
        category: json["category"],
        createdBy: json["createdBy"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "frontImage": frontImage,
        "backImage": backImage,
        "membership": membership,
        "layout": layout,
        "position": position,
        "category": category,
        "createdBy": createdBy,
        "__v": v,
    };
}
