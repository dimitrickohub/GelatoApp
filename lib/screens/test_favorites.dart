import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/songsJson/songs_model.dart';
import 'package:flutter_application_2/songsJson/songs_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<String>? listOfImg = [];
  String? img;
  void getSongs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      listOfImg = (prefs.getStringList('listOfSongs') ?? []);
    });
  }

  @override
  void initState() {
    getSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar() as PreferredSizeWidget?,
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
          // if (snapshot.data != null )
          final songs = snapshot.data!.body!;

          return ListView.builder(
            itemCount: songs.result!.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    songs.result![index].img!.toString()),
                                fit: BoxFit.contain)),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          child: Column(
                            children: <Widget>[
                              Text(
                                songs.result![index].title!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: Container(
                                      child: Text(
                                songs.result![index].description!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

Widget getAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    title: SafeArea(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'TestPage',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}


  // Widget getBody() {
  //   return FutureBuilder<List<SongsJson>>(
  //       future: fetchSongs(http.Client()),
  //       builder: (context, snapshot) {
  //         return ListView.builder(
  //           itemCount: 20,
  //           itemBuilder: (context, index) => ListTile(
  //               leading: ConstrainedBox(
  //                 constraints: BoxConstraints(
  //                   minWidth: 50,
  //                   minHeight: 50,
  //                   maxWidth: 50,
  //                   maxHeight: 50,
  //                 ),
  //                 child: Image.asset(songs[index].title, fit: BoxFit.cover),
  //               ),
  //               title: Text(
  //                 songs[index].title,
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               // subtitle: Text(
  //               //   '${songs[index].description.toString()}',
  //               //   style: TextStyle(
  //               //     fontSize: 12,
  //               //     fontWeight: FontWeight.w600,
  //               //   ),
  //               // ),
  //               onTap: () {
  //                 // Navigator.push(
  //                 //     context,
  //                 //     PageTransition(
  //                 //         alignment: Alignment.bottomCenter,
  //                 //         child: AlbumPage(
  //                 //           song: songs[index],
  //                 //         ),
  //                 //         type: null));
  //               }),
  //         );
  //       });
  // }
// }
