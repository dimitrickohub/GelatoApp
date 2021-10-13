import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/favorite_page.dart';
import 'package:flutter_application_2/screens/home_page.dart';

import 'package:flutter_application_2/screens/search_page/search_page1.dart';

import 'package:flutter_application_2/theme/colors.dart';

// import 'screens/favorite_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        const HomePage(),
        const SearchPage1(),
        // SearchPage(),

        FavoritePage(),
      ],
    );
  }

  Widget getFooter() {
    List items = [
      CupertinoIcons.home,
      CupertinoIcons.search,
      CupertinoIcons.heart,
    ];
    return Container(
        alignment: Alignment.center,
        height: 70,
        decoration: const BoxDecoration(),
        child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(items.length, (index) {
                  return IconButton(
                      icon: Icon(
                        items[index],
                        color: activeTab == index ? primary : grey,
                      ),
                      onPressed: () {
                        setState(() {
                          activeTab = index;
                        });
                      });
                }))));
  }
}
