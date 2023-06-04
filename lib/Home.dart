import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Player.dart';
import 'Statics.dart';
import 'drawer.dart';
import 'games.dart';
import 'team.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NBA DATA",
          style: GoogleFonts.getFont(
            'Crimson Text',
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Players()),
                    );
                  },
                  child:Stack(
                    children:[
                      Container(
                        decoration: BoxDecoration(

                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Center(
                            child: Image.asset('asserts/Logos/Players.png',fit:BoxFit.fill)
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 50,
                        child: Text(
                          'Players',
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Team()),
                    );
                  },
                  child: Stack(
                    children:[
                      Container(
                      decoration: BoxDecoration(

                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Center(
                        child: Image.asset('asserts/Logos/Teams.png',fit:BoxFit.fill)
                      ),
                    ),
                      Positioned(
                            bottom: 5,
                            left: 50,
                            child: Text(
                            'Team',
                             style: TextStyle(
                                 color: Colors.blueAccent,
                                 fontSize: 25,
                                 fontWeight: FontWeight.bold,

                                     ),
                                      ),
                                          ),
                       ],
                  ),

                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Games()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(

                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Image.asset('asserts/Logos/Games.png',fit:BoxFit.fill),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Statics()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(

                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Image.asset('asserts/Logos/Statics.png',fit:BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(name: 'NOthing',),
    );
  }
}
