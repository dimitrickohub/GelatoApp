import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/localization/language_constants.dart';

import 'package:flutter_application_2/screens/settings_page.dart';
import 'package:flutter_application_2/songsJson/songs_json.dart';
import 'package:flutter_application_2/songsJson/songs_model.dart';
import 'package:flutter_application_2/songsJson/songs_service.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'album_page.dart';

const _kExplore = 'explore';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu1 = 0;
  int activeMenu2 = 2;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar() as PreferredSizeWidget?,
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslated(context, _kExplore)!,
                style: const TextStyle(
                  fontSize: 20,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.topRight,
                            child: SettingsPage(),
                            type: PageTransitionType.scale));
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: white,
                  ))
            ],
          ),
        ),
      ),
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
            final songs = snapshot.data!.body!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:
                                  List.generate(song_type_1.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        activeMenu1 = index;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          song_type_1[index],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: activeMenu1 == index
                                                  ? primary
                                                  : grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        activeMenu1 == index
                                            ? Container(
                                                width: 10,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                    color: primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                );
                              })),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: List.generate(songs.result!.length - 5,
                                (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            alignment: Alignment.bottomCenter,
                                            child: AlbumPage(
                                              song: songs.result![index],
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
                                                image: NetworkImage(
                                                    songs.result![index].img!),
                                                fit: BoxFit.cover),
                                            color: primary,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          songs.result![index].title!
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 180,
                                        child: Text(
                                            songs.result![index].description!
                                                .toString(),
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: grey,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:
                                  List.generate(song_type_2.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        activeMenu2 = index;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          song_type_2[index],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: activeMenu2 == index
                                                  ? primary
                                                  : grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        activeMenu2 == index
                                            ? Container(
                                                width: 10,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                    color: primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                );
                              })),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: List.generate(songs.result!.length - 5,
                                (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            alignment: Alignment.bottomCenter,
                                            child: AlbumPage(
                                              song: songs.result![index + 5],
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
                                                    .result![index + 5].img!),
                                                fit: BoxFit.cover),
                                            color: primary,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          songs.result![index + 5].title!
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 180,
                                        child: Text(
                                            songs.result![index + 5].description
                                                .toString(),
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: grey,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
