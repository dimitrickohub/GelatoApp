import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/songsJson/songs_model.dart';
import 'package:flutter_application_2/songsJson/songs_service.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../album_page.dart';

List<Result> songList = [];

class SearchContent extends StatefulWidget {
  const SearchContent({Key? key}) : super(key: key);

  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  @override
  Widget build(BuildContext context) {
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
                  child: songList.isNotEmpty
                      ? ListView.builder(
                          itemCount: songList.length,
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
                                          songList[index].img.toString(),
                                          fit: BoxFit.cover),
                                    ),
                                    title: Text(
                                      songList[index].description.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      songList[index].title.toString(),
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
                                                song: songList[index],
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
}
