import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Data_point/team_data.dart';
import 'drawer.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  var search = TextEditingController();
  List<team> teams = [];
  List<team> filteredTeams = [];

  String setLogo(String city) {
    if(city.toLowerCase()=='charlotte')
      return  'asserts/Images/charlotte-bobcats.png';
    else if(city.toLowerCase()=='new-orlea')
      return  'asserts/Images/new-orlea.png';
    else if(city.toLowerCase()=='denver')
      return  'asserts/Images/denver.png';
    else if(city.toLowerCase()=='philadelphia')
      return  'asserts/Images/philadelphia.png';
    else if(city.toLowerCase()=='washington')
      return  'asserts/Images/washington.png';
    else if(city.toLowerCase()=='milwaukee')
      return  'asserts/Images/milwaukee.png';
    else if(city.toLowerCase()=='phoenix')
      return  'asserts/Images/phoenix.png';
    else if(city.toLowerCase()=='atlanta')
      return  'asserts/Images/atlanta.png';
    else if(city.toLowerCase()=='memphis')
      return  'asserts/Images/memphis.png';
    else if(city.toLowerCase()=='sacramento')
      return  'asserts/Images/sacramento-kings.png';
    else if(city.toLowerCase()=='los angles')
      return  'asserts/Images/los-angles.png';
    else if(city.toLowerCase()=='portland')
      return  'asserts/Images/portland.png';
    else if(city.toLowerCase()=='utah')
      return  'asserts/Images/utah.png';
    else if(city.toLowerCase()=='dallas')
      return  'asserts/Images/dallas.png';
    else if(city.toLowerCase()=='toronto')
      return  'asserts/Images/toronto.png';
    else if(city.toLowerCase()=='indiana')
      return  'asserts/Images/indiana.png';
    else if(city.toLowerCase()=='detroit')
      return  'asserts/Images/detroit.png';
    else if(city.toLowerCase()=='minnesota')
      return  'asserts/Images/minnesota.png';
    else if(city.toLowerCase()=='new york')
      return  'asserts/Images/new.png';
    else if(city.toLowerCase()=='oklahoma city')
      return  'asserts/Images/oklahoma.png';
    else if(city.toLowerCase()=='houston')
      return  'asserts/Images/houston.png';
    else if(city.toLowerCase()=='brooklyn')
      return  'asserts/Images/brooklyn.png';
    else if(city.toLowerCase()=='boston')
      return  'asserts/Images/boston.png';
    else if(city.toLowerCase()=='miami')
      return  'asserts/Images/miami.png';
    else if(city.toLowerCase()=='san antonio')
      return  'asserts/Images/san.png';
    else if(city.toLowerCase()=='cleveland')
      return  'asserts/Images/cleveland.png';
    else if(city.toLowerCase()=='los angeles')
      return  'asserts/Images/los.png';
    else if(city.toLowerCase()=='orlando')
      return  'asserts/Images/orlando.png';
    else if(city.toLowerCase()=='chicago')
      return  'asserts/Images/chicago.png';
    else if(city.toLowerCase()=='san francisco')
      return  'asserts/Images/golden.png';
    else
    {
      return 'asserts/Images/backetball.jpg';
    }
  }

  Future<void> getTeams() async {
    var response =
    await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    var jsonData = jsonDecode(response.body);
    for (var object in jsonData['data']) {
      String logo = setLogo(object['city']);
      final teamA = team(
        object['name'],
        object['full_name'],
        object['abbreviation'],
        object['city'],
        object['conference'],
        object['division'],
        logo,
      );
      teams.add(teamA);
    }

    setState(() {
      filteredTeams = teams;
    });
  }
  var _isLoading = true;
  void _startTimer() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    getTeams();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:_isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: [
          TextFormField(
            controller: search,
            decoration: InputDecoration(
              hintText: 'Search Data',
              border: OutlineInputBorder(),
            ),
            onChanged: (String value) {
              setState(() {
                serachTeam(value);
              });
            },
          ),
          Expanded(
            child: GridView.builder(
              itemCount: search.text.isEmpty
                  ? teams.length
                  : filteredTeams.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                final teamItem = search.text.isEmpty
                    ? teams[index]
                    : filteredTeams[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 8.0),
                    child: Column(
                      children: [
                        SizedBox(width: 4,),
                        Image.asset(
                          teamItem.Image,
                          height: 60,
                          width: 60,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(teamItem.full_name),
                        ),
                        SizedBox(height: 3,),
                        Text("City: " + teamItem.city),
                        SizedBox(height: 3,),
                        Text("ABB: " + teamItem.abbreviation),
                        SizedBox(height: 3,),
                        Text("DIV: " + teamItem.division),
                        SizedBox(height: 3,),
                        Text("Conf: " + teamItem.conference),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: MyDrawer(name: 'Team'),
    );
  }

  void serachTeam(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredTeams = teams;
      });
    } else {
      setState(() {
        filteredTeams = teams
            .where((team) =>
            team.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }
}
