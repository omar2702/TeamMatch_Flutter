import 'package:flutter/material.dart';

class TourmentScreen extends StatefulWidget {
  @override
  _TourmentScreenState createState() => _TourmentScreenState();
}

class _TourmentScreenState extends State<TourmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournaments'),
      ),
      body: ListView(
        children: <Widget>[
          _cardTournament(),
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }

Widget _cardTournament() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.anchor_sharp,
              color: Colors.blue,
              size: 35 ,
            ),
            title: Text('Twitch Rivals'),
            subtitle: Text('Compite con tus amigos y obten el gran premio'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ignore: deprecated_member_use
              FlatButton(onPressed: () {}, child: Text('Detalles')),
                            // ignore: deprecated_member_use
              FlatButton(onPressed: () {}, child: Text('Unirse'))
            ],
          )
        ],
      ),
    );
  }
}