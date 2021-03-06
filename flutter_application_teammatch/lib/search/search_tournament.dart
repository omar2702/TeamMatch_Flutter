import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/search/search_delegate.dart';

class SearchTournament extends StatelessWidget {
  const SearchTournament({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Search Tournament'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/luna.jpg'), fit: BoxFit.cover)),
      ),
    );
  }
}
