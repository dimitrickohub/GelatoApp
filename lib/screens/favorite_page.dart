import 'package:flutter/material.dart';
import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/screens/album_page.dart';
import 'package:flutter_application_2/songsJson.dart/songs_json.dart';
import 'package:page_transition/page_transition.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: SafeArea(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            getTranslated(context, 'favorites'),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) => ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 50,
              minHeight: 50,
              maxWidth: 50,
              maxHeight: 50,
            ),
            child: Image.asset(songs[index]['img'], fit: BoxFit.cover),
          ),
          title: Text(
            songs[index]['description'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            '${songs[index]['title'].toString()}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    alignment: Alignment.bottomCenter,
                    child: AlbumPage(
                      song: songs[index],
                    ),
                    type: null));
          }),
    );
  }
}
