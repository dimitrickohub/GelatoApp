import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/songsJson.dart/songs_json.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';

import 'album_page.dart';

class SearchPage extends StatefulWidget {
  final dynamic song;

  const SearchPage({Key key, this.song}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> _foundSongs = [];
  @override
  initState() {
    _foundSongs = songs;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      results = songs;
      super.initState();
    } else {
      results = songs
          .where((element) => element["description"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundSongs = results;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(10),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  style: TextStyle(color: white),
                  decoration: InputDecoration(
                    hintText: getTranslated(context, 'search'),
                    hintStyle: TextStyle(
                      color: primary.withAlpha(120),
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => _runFilter(value),
                ),
              ),
              Icon(Feather.search, color: primary),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            getTranslated(context, 'search_text'),
            style: TextStyle(
              fontSize: 20,
              color: primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: _foundSongs.length > 0
                ? ListView.builder(
                    itemCount: _foundSongs.length,
                    itemBuilder: (context, index) => Card(
                          color: primary.withAlpha(120),
                          elevation: 4,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: ListTile(
                              leading: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 50,
                                  minHeight: 50,
                                  maxWidth: 50,
                                  maxHeight: 50,
                                ),
                                child: Image.asset(songs[index]['img'],
                                    fit: BoxFit.cover),
                              ),
                              title: Text(
                                _foundSongs[index]['description'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                '${_foundSongs[index]['title'].toString()}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: white,
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
                        ))
                : Text(
                    getTranslated(context, 'not_found'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: primary,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
      ],
    );
  }
}
