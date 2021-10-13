import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/db/database_helper.dart';

import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/screens/music_data.dart';

import 'package:flutter_application_2/theme/colors.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';

// ignore: use_key_in_widget_constructors
class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final dbHelper = DatabaseHelper.instance;
  @override
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
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            getTranslated(context, 'favorites')!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot snapshot) {
        // ignore: unnecessary_null_comparison
        if (ConnectionState.active != null && !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        // ignore: unnecessary_null_comparison
        if (ConnectionState.done != null && snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return Slidable(
              actionPane: const SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Delete',
                  color: red,
                  icon: CupertinoIcons.delete,
                  onTap: () => dbHelper.delete(snapshot.data[index]['_id']),
                ),
              ],
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          alignment: Alignment.bottomCenter,
                          child: MusicData(
                            title: snapshot.data[index]['title'],
                            description: snapshot.data[index]['description'],
                            img: snapshot.data[index]['img'],
                            songUrl: snapshot.data[index]['songUrl'],
                          ),
                          type: PageTransitionType.scale));
                },
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage(snapshot.data[index]['img']),
                                  fit: BoxFit.contain)),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  snapshot.data[index]['title'],
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  snapshot.data[index]['description'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      future: dbHelper.queryAllRows(),
    );
  }
}
