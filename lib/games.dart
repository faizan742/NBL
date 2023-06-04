import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Data_point/games_data.dart';
import 'drawer.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  String setlogo(String city)
  {

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
  var search = TextEditingController();
  List<Games_Info> games=[];
  List<Games_Info> filteredGames = [];
  Future getTeams() async{
    int page=1;
    int total=30;
    while(page<=total){
      var response = await http.get(Uri.https('balldontlie.io','api/v1/games',{'page': page.toString()}));
      var jsonData = jsonDecode(response.body);
      //print(jsonData['data']);
      for( var object in jsonData['data'])
      {
        String h_logo;
        String a_logo;
        h_logo= setlogo(object['home_team']['city']) ;
        a_logo=setlogo(object['visitor_team']['city']);
        final game=Games_Info(object['home_team']['abbreviation'], object['visitor_team']['abbreviation'], object['home_team_score'], object['visitor_team_score'], a_logo, h_logo, object['date'], object['season'], object['status']);
        games.add(game);

      }
      page++;
    }
    print(games.length);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Games"),),
      body:FutureBuilder(
          future: getTeams(),
      builder:(context,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
         return Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               TextFormField(
                 controller: search,

                 decoration: InputDecoration(
                   hintText: 'Search Data',
                   border: OutlineInputBorder(),

                 ),
                 onChanged: (String value)
                 {
                   setState(() {
                     search.text=value;

                   });
                 },

               ),
               Expanded(

                   child: ListView.builder(

                       itemCount: games.length,
                       itemBuilder: (context,index){
                        String title = games[index].Home_team;
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8.0,8.0,0.0,8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 8,),
                                      Image.asset(
                                        games[index].Home_Image, height: 60,
                                        width: 60,),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(games[index].Home_team),
                                      ),
                                      SizedBox(width: 30,),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          games[index].Home_Score.toString(),
                                          style: TextStyle(fontSize: 20,
                                              fontFamily: 'MISTRAL'),),
                                      ),
                                      Text("-", style: TextStyle(fontSize: 20)),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            games[index].Away_Score.toString(),
                                            style: TextStyle(fontSize: 20,
                                                fontFamily: 'MISTRAL')),
                                      ),
                                      SizedBox(width: 37,),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(games[index].Away_team),
                                      ),

                                      Image.asset(
                                        games[index].Away_Image, height: 60,
                                        width: 60,),


                                    ],
                                  ),

                                  Text(DateFormat("MMMM dd, yyyy hh:mm:ss a")
                                      .format(DateTime.parse(games[index].Date))
                                      .toString()),
                                  SizedBox(height: 5),
                                  Text(
                                      "Season " + games[index].Season.toString() +
                                          " " + "Status " + games[index].Status),
                                ],
                              ),
                            ),);

                   }))
             ],
           ),
         );
        }
        else if(snapshot.connectionState==ConnectionState.waiting)
          {
              return Center(child: CircularProgressIndicator(),);
          }
        else {
          // Add a default return statement when connectionState is neither done nor waiting
          return Center(
            child: Text("Something went wrong!"),
          );
        }

      }
      ),





      drawer: MyDrawer(name:'Games'),
    );
  }
}
