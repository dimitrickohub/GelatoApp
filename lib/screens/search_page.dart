import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/songsJson/songs_json.dart';
import 'package:flutter_application_2/songsJson/songs_model.dart';
import 'package:flutter_application_2/songsJson/songs_service.dart';
import 'package:flutter_application_2/theme/colors.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'album_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // dynamic _foundSongs = [];
  // SongsJson? songsJson;
  // Response? response;
  // Future<Response<SongsJson>?> getListOfSongs() async {
  //   response = await Provider.of<SongService>(context).getSongs();
  //   setState(() {
  //     songsJson = SongsJson.fromJson(response?.body);
  //   });
  // }

  // @override
  // initState() {
  //   _foundSongs = songsJson!.result!;
  //   super.initState();
  // }

  // void _runFilter(String enteredKeyword) async {
  //   dynamic results = [];

  //   if (enteredKeyword.isEmpty) {
  //     results = songsJson;
  //   } else {
  //     results = songsJson!.result!.single.description!
  //         .toLowerCase()
  //         .contains(enteredKeyword.toLowerCase());
  //   }

  //   setState(() {
  //     _foundSongs = results;
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       SizedBox(
        //         height: 20,
        //       ),
        //       Container(
        //         margin: EdgeInsets.only(top: 10),
        //         padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        //         decoration: BoxDecoration(
        //           color: Colors.white.withAlpha(20),
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //         ),
        //         child: Row(
        //           children: <Widget>[
        //             Expanded(
        //               child: TextField(
        //                 decoration: InputDecoration(
        //                   hintText: getTranslated(context, 'search'),
        //                   hintStyle: TextStyle(
        //                     color: primary.withAlpha(120),
        //                   ),
        //                   border: InputBorder.none,
        //                 ),
        //                 onChanged: (value) => _runFilter(value),
        //               ),
        //             ),
        //             Icon(CupertinoIcons.search, color: primary),
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(left: 10, right: 10),
        //         child: Text(
        //           getTranslated(context, 'search_text')!,
        //           style: TextStyle(
        //             fontSize: 20,
        //             color: primary,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 15,
        //       ),
        //       Expanded(
        //           child: _foundSongs.length > 0
        //               ? ListView.builder(
        //                   itemCount: _foundSongs.length,
        //                   itemBuilder: (context, index) => Card(
        //                         color: primary.withAlpha(120),
        //                         elevation: 4,
        //                         margin: EdgeInsets.symmetric(
        //                             vertical: 10, horizontal: 10),
        //                         child: ListTile(
        //                             leading: ConstrainedBox(
        //                               constraints: BoxConstraints(
        //                                 minWidth: 50,
        //                                 minHeight: 50,
        //                                 maxWidth: 50,
        //                                 maxHeight: 50,
        //                               ),
        //                               // child: Image.asset( _foundSongs[index]['img'],
        //                               //     fit: BoxFit.cover),
        //                             ),
        //                             // title: Text(
        //                             //   _foundSongs[index].description,
        //                             //   style: TextStyle(
        //                             //     fontSize: 16,
        //                             //     fontWeight: FontWeight.w600,
        //                             //   ),
        //                             // ),
        //                             // subtitle: Text(
        //                             //   '${_foundSongs[index].title.toString()}',
        //                             //   style: TextStyle(
        //                             //     fontSize: 12,
        //                             //     fontWeight: FontWeight.w600,
        //                             //   ),
        //                             // ),
        //                             onTap: () {
        //                               Navigator.push(
        //                                   context,
        //                                   PageTransition(
        //                                       alignment: Alignment.bottomCenter,
        //                                       child: AlbumPage(
        //                                         song: song[index],
        //                                       ),
        //                                       type: PageTransitionType.scale));
        //                             }),
        //                       ))
        //               : Text(
        //                   getTranslated(context, 'not_found')!,
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                     fontSize: 20,
        //                     color: primary,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 )),
        //     ],
      ),
    );
  }
}
