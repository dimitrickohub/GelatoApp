import 'package:flutter/cupertino.dart';

class SongsJson {
  List<Result>? result;

  SongsJson({this.result});

  SongsJson.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? img;
  String? title;
  String? description;
  String? songCount;
  String? date;
  String? songUrl;
  List<Songs>? songs;

  Result(
      {this.img,
      this.title,
      this.description,
      this.songCount,
      this.date,
      this.songUrl,
      @required this.songs});

  Result.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    title = json['title'];
    description = json['description'];
    songCount = json['song_count'];
    date = json['date'];
    songUrl = json['song_url'];
    if (json['songs'] != null) {
      songs = <Songs>[];
      json['songs'].forEach((v) {
        songs!.add(Songs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = img;
    data['title'] = title;
    data['description'] = description;
    data['song_count'] = songCount;
    data['date'] = date;
    data['song_url'] = songUrl;
    if (songs != null) {
      data['songs'] = songs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Songs {
  String? title;
  String? duration;

  Songs({this.title, this.duration});

  Songs.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['duration'] = duration;
    return data;
  }
}
