import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/constants/teams_api.dart';
import 'package:flutter_application_teammatch/models/team.dart';
import 'package:flutter_application_teammatch/pages/team_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamNetworkPage extends StatefulWidget {
  @override
  _TeamNetworkPageState createState() => _TeamNetworkPageState();
}

class _TeamNetworkPageState extends State<TeamNetworkPage> {
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/header_home.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Search Your New Team'),
          ),
          body: FutureBuilder<List<Team>>(
            future: TeamsApi.getTeams(),
            builder: (context, snapshot) {
              final teams = snapshot.data;

              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Some error occurred!'));
                  } else {
                    return buildTeams(teams);
                  }
              }
            },
          ),
        ),
      );

  Widget buildTeams(List<Team> teams) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: teams.length,
        itemBuilder: (context, index) {
          final team = teams[index];

          return Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: [
                ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TeamPage(team: team),
                  )),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(team.image_url),
                    backgroundColor: Colors.white,
                  ),
                  trailing: FaIcon(FontAwesomeIcons.arrowRight),
                  title: Text(team.name),
                  subtitle: Text(team.location),
                ),
              ],
            ),
          );
        },
      );
}
