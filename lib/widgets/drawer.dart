import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:winhacks_21/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
const double smallFont = 0.05;
const double largeFont = 0.1;

Drawer userHomeDrawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: Color(0xff013C38).withOpacity(0.6),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.only(
                top: screenHeight(context) * smallFont,
                bottom: 0.0,
                left: screenWidth(context) * smallFont * 0.75,
                right: screenWidth(context) * smallFont * 0.75),
            margin: EdgeInsets.only(
              top: screenHeight(context) * smallFont * 0.5,
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Third Eye',
                    style: GoogleFonts.keaniaOne(
                        color: Colors.white60, fontSize: screenWidth(context) * 0.1),
                  ),
                  trailing: CircleAvatar(
                    child: Image.asset('images/att.jpeg'),
                    radius: screenWidth(context) * 0.1,
                    backgroundColor: Colors.white60,
                  ),
                ),
                SizedBox(
                  height: screenHeight(context) * 0.02,
                ),
                Container(
                  height: screenHeight(context) * smallFont * 0.1,
                  decoration: BoxDecoration(color: Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight(context) * 0.02,
          ),
          NavTile(
            icon: Icon(CupertinoIcons.book_solid),
            text: 'Timetable',
            onTap: () {},
          ),
          Container(
            height: screenHeight(context) * smallFont * 0.05,
            margin: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.05),
            decoration: BoxDecoration(color: Colors.black54),
          ),
          SizedBox(
            height: screenHeight(context) * 0.02,
          ),
          NavTile(
            icon: Icon(Icons.history),
            text: 'Attendance History',
          ),
          Container(
            height: screenHeight(context) * smallFont * 0.05,
            margin: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.05),
            decoration: BoxDecoration(color: Colors.black54),
          ),
          SizedBox(
            height: screenHeight(context) * 0.02,
          ),
          NavTile(
            icon: Icon(Icons.account_circle),
            text: 'Profile',
          ),
          Container(
            height: screenHeight(context) * smallFont * 0.05,
            margin: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.05),
            decoration: BoxDecoration(color: Colors.black54),
          ),
          SizedBox(
            height: screenHeight(context) * 0.02,
          ),
          NavTile(
            icon: Icon(Icons.exit_to_app),
            text: 'Logout',
            onTap: () {
              firebaseAuth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}

class NavTile extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function onTap;

  NavTile({this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: onTap,
    );
  }
}
