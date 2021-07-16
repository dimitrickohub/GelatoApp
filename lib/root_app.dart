import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home_page.dart';
import 'package:flutter_application_2/screens/search_page.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'screens/favorite_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        SearchPage(),
        FavoritePage(),
        // Center(
        //   child: Text(
        //     "Home",
        //     style: TextStyle(
        //         fontSize: 20, color: white, fontWeight: FontWeight.bold),
        //   ),
        // ),
        // Center(
        //   child: Text("Serch",
        //       style: TextStyle(
        //           fontSize: 20, color: white, fontWeight: FontWeight.bold)),
        // ),
        // Center(
        //   child: Text("Favorite",
        //       style: TextStyle(
        //           fontSize: 20, color: white, fontWeight: FontWeight.bold)),
        // )
      ],
    );
  }

  Widget getFooter() {
    List items = [
      Feather.home,
      Feather.search,
      Feather.heart,
    ];
    return Container(
        alignment: Alignment.center,
        height: 70,
        decoration: BoxDecoration(color: black),
        child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(items.length, (index) {
                  return IconButton(
                      icon: Icon(
                        items[index],
                        color: activeTab == index ? primary : white,
                      ),
                      onPressed: () {
                        setState(() {
                          activeTab = index;
                        });
                      });
                }))));
  }
}
