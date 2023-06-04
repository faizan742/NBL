import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Data_point/Player_data.dart';

import 'drawer.dart';

class Players extends StatefulWidget {
  const Players({Key? key}) : super(key: key);

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  var search = TextEditingController();
  List<Player_data> players = [];
  List<Player_data> filteredplayers = [];

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
      Random random = new Random();
      int randomNumber = random.nextInt(10);
      if(randomNumber==0)
         return 'asserts/Images/image.png';
      if(randomNumber==1)
        return 'asserts/Images/image (1).png';
      if(randomNumber==2)
        return 'asserts/Images/image (2).png';
      if(randomNumber==3)
        return 'asserts/Images/image (3).png';
      if(randomNumber==4)
        return 'asserts/Images/image (4).png';
      if(randomNumber==5)
        return 'asserts/Images/image (5).png';
      if(randomNumber==6)
        return 'asserts/Images/image (6).png';
      if(randomNumber==7)
        return 'asserts/Images/image (7).png';
      if(randomNumber==8)
        return 'asserts/Images/image (8).png';
      if(randomNumber==9)
        return 'asserts/Images/image (9).png';
      else
        {
          return 'asserts/Images/image (10).png';
        }
    }
  }

  Future<void> getTeams() async {
    int page=1;
    int total_page=10;
    while(page<=total_page)
      {
        var response = await http.get(Uri.https('balldontlie.io', 'api/v1/players',{'page': page.toString()}));
        if(response.statusCode==200){
          var jsonData = jsonDecode(response.body);
          for (var object in jsonData['data']) {
            String logo = setLogo(object['team']['city']);
            final player = Player_data(
              logo,
              object['first_name']+" "+object['last_name'],
              object['team']['name'],
              object['position'],
              object['height_feet']==null?0:object['height_feet'],
              object['weight_pounds']==null?0:object['weight_pounds'],

            );
            //print(object['height_feet']);
            players.add(player);

        }
        }
        else
        {
          print('Error: ${response.statusCode}');
        }

        page++;
      }

    //print(response.headers);
    print(players.length);
    setState(() {
      filteredplayers = players;
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
          :Column(
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
                  ? players.length
                  : filteredplayers.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                final teamItem = search.text.isEmpty
                    ? players[index]
                    : filteredplayers[index];
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
                          child: Text(teamItem.name),
                        ),
                        SizedBox(height: 3,),
                        Text(teamItem.team_name),
                        SizedBox(height: 3,),
                        Text("Position: " + teamItem.Position),
                        SizedBox(height: 3,),
                        Text("Height: " + teamItem.Height.toString()),
                        SizedBox(height: 3,),
                        Text("Weight: " + teamItem.Weight.toString()),
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
        filteredplayers = players;
      });
    } else {
      setState(() {
        filteredplayers = players
            .where((play) =>
            play.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }
}
