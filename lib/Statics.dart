import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nbl/Data_point/static_data.dart';
import 'Data_point/games_data.dart';
import 'drawer.dart';

class Statics extends StatefulWidget {
  const Statics({Key? key}) : super(key: key);

  @override
  State<Statics> createState() => _StaticsState();
}

class _StaticsState extends State<Statics> {
  String setlogo(String city) {
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
  var search = TextEditingController();
  List<static_data> statics=[];
  List<static_data> filteredstatics = [];
  Future getTeams() async{
    int page=2040;
    int total=2042;
    while(page<=total){
      var response = await http.get(Uri.https('balldontlie.io','api/v1/stats',{'page': page.toString()} ));
      var jsonData = jsonDecode(response.body);
        //print(jsonData);
      for( var object in jsonData['data'])
      {
        print(object);
        String h_logo;
        h_logo= setlogo(object['team']['city']) ;
        final stat=static_data(h_logo,object['game']['home_team_score']==null?0:object['game']['home_team_score'], object['game']['visitor_team_score']==null?0:object['game']['visitor_team_score'], object['team']['full_name']==null?"No data":object['team']['full_name'], object['game']['date']==null?"0":object['game']['date'], object['game']['season']==null?0:object['game']['season'],object['player']['first_name']==null || object['player']['last_name']==null?"Player":object['player']['first_name']+" "+object['player']['last_name']);
        //print(object['first_name']);

        statics.add(stat);
      }
      page++;
    }
    print(statics.length);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Statics"),),
      body:FutureBuilder(
          future: getTeams(),
          builder:(context,snapshot){
            print(statics.length);
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

                            itemCount: statics.length,
                            itemBuilder: (context,index){
                              String title = statics[index].team;
                              return ListTile(
                                contentPadding: EdgeInsets.all(8.0),
                                leading: ClipOval(
                                  child: Image.asset(
                                    statics[index].Image, // Replace with your image URL
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(statics[index].H_Score.toString()+"-"+statics[index].V_Score.toString()+"   Season: "+ statics[index].season.toString()),
                                        Text(statics[index].player_name),
                                        Text(statics[index].team),
                                        Text(statics[index].date=="0"?statics[index].date:DateFormat("MMMM dd, yyyy hh:mm a")
                                            .format(DateTime.parse(statics[index].date))
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              );

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
