import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/screens/search_page/search_content.dart';
import 'package:flutter_application_2/songsJson/songs_model.dart';
import 'package:flutter_application_2/theme/colors.dart';

class SearchHeader extends StatefulWidget {
  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  // ignore: unused_field
  List<Result> _foundSongs = [];

  void _runFilter(String enteredKeyword) async {
    dynamic results = [];

    if (enteredKeyword.isEmpty) {
      results = songList;
    } else {
      results = songList.where((elem) => elem.title
          .toString()
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()));
    }

    setState(() {
      _foundSongs = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(20),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
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
              const Icon(CupertinoIcons.search, color: primary),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            getTranslated(context, 'search_text')!,
            style: const TextStyle(
              fontSize: 20,
              color: primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
