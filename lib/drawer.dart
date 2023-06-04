import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nbl/routes.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          ListTile(
            leading: name=='Games'? Icon(Icons.home, color: Colors.white) :Icon(Icons.sports_basketball, color: Colors.white),
            title: name=='Games'? Text("Home",style: GoogleFonts.getFont(
              'Roboto',
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),)
                :Text("Games",style: GoogleFonts.getFont(
              'Roboto',
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),),
            onTap: ()
            {
              if(name=='Games')
                {
                  Navigator.pushNamed(context, Routes.Home);
                }else
                  {
                    Navigator.pushNamed(context, Routes.Games);
                  }

            },
          ),
          ListTile(
            leading: name=='Player'? Icon(Icons.home, color: Colors.white) :Icon(Icons.sports_handball, color: Colors.white),
            title: name=='Player'? Text("Home",style: GoogleFonts.getFont(
              'Roboto',
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),)
                :Text("Player",style: GoogleFonts.getFont(
              'Roboto',
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),),
            onTap: ()
            {
              if(name=='Player')
              {
                Navigator.pushNamed(context, Routes.Home);
              }else
              {
                Navigator.pushNamed(context, Routes.Players);
              }

            },
          ),
          ListTile(
            leading: name=='Team'? Icon(Icons.home, color: Colors.white) :Icon(Icons.family_restroom, color: Colors.white),
            title: name=='Team'? Text("Home",style: GoogleFonts.getFont(
              'Roboto',
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),)
                :Text("Team",style: GoogleFonts.getFont(
              'Roboto',
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),),
            onTap: ()
            {
              if(name=='Team')
              {
                Navigator.pushNamed(context, Routes.Home);
              }else
              {
                Navigator.pushNamed(context, Routes.team);
              }

            },
          ),
          ListTile(
            leading: name=='Statics'? Icon(Icons.home, color: Colors.white) :Icon(Icons.stacked_line_chart, color: Colors.white),
            title: name=='Statics'? Text("Home",style: GoogleFonts.getFont(
              'Roboto',
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),)
                :Text("Statics",style: GoogleFonts.getFont(
              'Roboto',
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),),
            onTap: ()
            {
              if(name=='Statics')
              {
                Navigator.pushNamed(context, Routes.Home);
              }else
              {
                Navigator.pushNamed(context, Routes.Static);
              }

            },
          ),
        ],
      ),
    );
  }
}
