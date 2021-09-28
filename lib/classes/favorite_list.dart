import 'dart:convert';

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
