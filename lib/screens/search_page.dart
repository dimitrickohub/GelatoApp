import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/songsJson/songs_model.dart';
import 'package:flutter_application_2/songsJson/songs_service.dart';
import 'package:flutter_application_2/theme/colors.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'album_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Result> songList = [];
  // ignore: unused_field
  List<Result> _foundSongs = [];

  @override
  initState() {
    _foundSongs = songList;
    super.initState();
  }

  void _runFilter(String enteredKeyword) async {
    dynamic results = [];

    if (enteredKeyword.isEmpty) {
      results = songList;
    } else {
      results = songList
          .where((elem) => elem.title
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundSongs = results;
    });
  }

  FutureBuilder<Response<SongsJson>> _buildBody() {
    return FutureBuilder<Response<SongsJson>>(
      future: Provider.of<SongService>(context).getSongs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }

          songList = snapshot.data!.body!.result!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: _foundSongs.isNotEmpty
                      ? ListView.builder(
                          itemCount: _foundSongs.length,
                          itemBuilder: (context, index) => Card(
                                color: primary.withAlpha(120),
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: ListTile(
                                    leading: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        minWidth: 50,
                                        minHeight: 50,
                                        maxWidth: 50,
                                        maxHeight: 50,
                                      ),
                                      child: Image.network(
                                          _foundSongs[index].img.toString(),
                                          fit: BoxFit.cover),
                                    ),
                                    title: Text(
                                      _foundSongs[index].description.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      _foundSongs[index].title.toString(),
                                      style: const TextStyle(
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
                                                song: _foundSongs[index],
                                              ),
                                              type: PageTransitionType.scale));
                                    }),
                              ))
                      : Text(
                          getTranslated(context, 'not_found')!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: primary,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
            ],
          );
        } else {
          return const Center(
            child: Text('Not found'),
          );
        }
      },
    );
  }

  Column _buildSearch() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(flex: 1, child: _buildSearch()),
            Flexible(flex: 3, child: _buildBody())
          ],
        ),
      ),
    );
  }
}
