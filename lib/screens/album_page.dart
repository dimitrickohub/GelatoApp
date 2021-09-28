import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/classes/favorite_list.dart';
import 'package:flutter_application_2/localization/language_constants.dart';

import 'package:flutter_application_2/screens/music_data.dart';

import 'package:flutter_application_2/songsJson/songs_model.dart';
import 'package:flutter_application_2/songsJson/songs_service.dart';
import 'package:flutter_application_2/theme/colors.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlbumPage extends StatefulWidget {
  final song;

  const AlbumPage({Key? key, this.song}) : super(key: key);
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  bool _isSub = false;

  List<FavoriteList>? music;

  void _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String encodedData = FavoriteList.encode([
      FavoriteList(
        img: widget.song?.img,
        title: widget.song?.title,
        description: widget.song?.description,
        songUrl: widget.song?.songUrl,
      )
    ]);

    prefs.setString('favList', encodedData);
  }

  void _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (_isSub) {
        _isSub = false;
        prefs.setBool('_isSub', _isSub);
      } else {
        _isSub = true;
        prefs.setBool('_isSub', _isSub);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _toggleFavorite();
    _saveFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
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

            var size = MediaQuery.of(context).size;
            final songs = snapshot.data!.body!;
            // ignore: unused_local_variable
            int index = 0;

            return LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return Container(
                height: viewportConstraints.maxHeight,
                child: SingleChildScrollView(
                    child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: size.width,
                          height: 220,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.song?.img),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.song.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Container(
                                child: ElevatedButton(
                                    child: Text(
                                      _isSub
                                          ? getTranslated(
                                              context, 'subscription')!
                                          : getTranslated(
                                              context, 'subscribe')!,
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                          if (_isSub)
                                            return grey;
                                          else
                                            return primary;
                                        },
                                      ),
                                    ),
                                    onPressed: () async {
                                      _toggleFavorite();
                                      _saveFavorites();
                                    }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children:
                                  List.generate(songs.result!.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              alignment: Alignment.bottomCenter,
                                              child: MusicData(
                                                title:
                                                    songs.result![index].title,
                                                description: songs
                                                    .result![index].description,
                                                img: widget.song.img,
                                                songUrl: songs
                                                    .result![index].songUrl,
                                              ),
                                              type: PageTransitionType.scale));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 180,
                                          height: 180,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(songs
                                                      .result![index].img
                                                      .toString()),
                                                  fit: BoxFit.cover),
                                              color: primary,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            songs.result![index].title
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            width: size.width - 210,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    songs.result![index]
                                                        .songCount
                                                        .toString(),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: grey,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                                Text(
                                                    songs.result![index].date
                                                        .toString(),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: grey,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                            children: List.generate(
                                songs.result!.last.songs!.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        alignment: Alignment.bottomCenter,
                                        child: MusicData(
                                          title: songs.result![index].title
                                              .toString(),
                                          description: songs
                                              .result![index].description
                                              .toString(),
                                          img: songs.result![index].img,
                                          songUrl: songs.result![index].songUrl
                                              .toString(),
                                        ),
                                        type: PageTransitionType.scale));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: (size.width - 60) * 0.77,
                                    child: Text(
                                      "${index + 1}" +
                                          songs.result![index].songs![index]
                                              .title
                                              .toString(),
                                    ),
                                  ),
                                  Container(
                                      width: (size.width - 60) * 0.23,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            songs.result![index].songs![index]
                                                .duration
                                                .toString(),
                                            style: TextStyle(
                                                color: grey, fontSize: 14),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: grey.withOpacity(0.8),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.play_arrow,
                                                size: 16,
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          );
                        }))
                      ],
                    ),
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.back,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.add,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )),
              );
            });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
