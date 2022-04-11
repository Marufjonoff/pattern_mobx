// To parse this JSON data, do
//
//     final Post = PostFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.name,
    required this.title,
    required this.body,
    required this.dateTime,
    required this.id,
  });

  String name;
  String title;
  String body;
  String dateTime;
  String id;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    name: json["name"],
    title: json["title"],
    body: json["body"],
    dateTime: json["dateTime"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "title": title,
    "body": body,
    "dateTime": dateTime,
    "id": id,
  };
}
