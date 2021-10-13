import 'dart:convert';

//  class Favorites {
//   List<FavoriteList>? result;

//   Favorites({this.result});

//   Favorites.fromJson(Map<String, dynamic> json) {
//     if (json['result'] != null) {
//       result = <FavoriteList>[];
//       json['result'].forEach((v) {
//         result!.add(new FavoriteList.fromJson(v));
//       });
//     }
//   }

//   static String encode(List<FavoriteList> music) => json.encode(
//         music
//             .map<Map<String, dynamic>>((music) => FavoriteList.toMap(music))
//             .toList(),
//       );

//       static List<Favorites> decode(String music) =>
//       (json.decode(music) as List<dynamic>)
//           .map<Favorites>((item) => Favorites.fromJson(item))
//           .toList();
// }

class FavoriteList {
  int? id;
  String? img;
  String? title;
  String? description;

  String? songUrl;

  FavoriteList({this.id, this.img, this.title, this.description, this.songUrl});
  factory FavoriteList.fromJson(Map<String, dynamic> jsonData) {
    return FavoriteList(
      id: jsonData['id'],
      img: jsonData['img'],
      title: jsonData['title'],
      description: jsonData['description'],
      songUrl: jsonData['songUrl'],
    );
  }

  static Map<String, dynamic> toMap(FavoriteList favorites) => {
        'id': favorites.id,
        'img': favorites.img,
        'title': favorites.title,
        'description': favorites.description,
        'songUrl': favorites.songUrl,
      };

  static String encode(List<FavoriteList> music) => json.encode(
        music
            .map<Map<String, dynamic>>((music) => FavoriteList.toMap(music))
            .toList(),
      );

  static List<FavoriteList> decode(String music) =>
      (json.decode(music) as List<dynamic>)
          .map<FavoriteList>((item) => FavoriteList.fromJson(item))
          .toList();
}




// import 'package:flutter/cupertino.dart';

// class FavoriteList {
//   List<Result>? result;

//   FavoriteList({this.result});

//   FavoriteList.fromJson(Map<String, dynamic> json) {
//     if (json['result'] != null) {
//       result = <Result>[];
//       json['result'].forEach((v) {
//         result!.add(new Result.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.result != null) {
//       data['result'] = this.result!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
//   static String encode(List<FavoriteList> music) => json.encode(
//         music
//             .map<Map<String, dynamic>>((music) => FavoriteList.toMap(music))
//             .toList(),
//       );
// }

// class Result {
//   String? img;
//   String? title;
//   String? description;
//   String? songCount;
//   String? date;
//   String? songUrl;
//   List<Songs>? songs;

//   Result(
//       {this.img,
//       this.title,
//       this.description,
//       this.songCount,
//       this.date,
//       this.songUrl,
//       @required this.songs});

//   Result.fromJson(Map<String, dynamic> json) {
//     img = json['img'];
//     title = json['title'];
//     description = json['description'];
//     songCount = json['song_count'];
//     date = json['date'];
//     songUrl = json['song_url'];
//     if (json['songs'] != null) {
//       songs = <Songs>[];
//       json['songs'].forEach((v) {
//         songs!.add(new Songs.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['img'] = this.img;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['song_count'] = this.songCount;
//     data['date'] = this.date;
//     data['song_url'] = this.songUrl;
//     if (this.songs != null) {
//       data['songs'] = this.songs!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Songs {
//   String? title;
//   String? duration;

//   Songs({this.title, this.duration});

//   Songs.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     duration = json['duration'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['duration'] = this.duration;
//     return data;
//   }
// }
