import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/search_page/search_content.dart';
import 'package:flutter_application_2/screens/search_page/search_header.dart';

class SearchPage1 extends StatelessWidget {
  const SearchPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(flex: 1, child: SearchHeader()),
            Flexible(flex: 3, child: SearchContent())
          ],
        ),
      ),
    );
  }
}
