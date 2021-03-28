import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winhacks_21/screens/absent_screen.dart';
import 'package:winhacks_21/screens/status_screen.dart';
import 'package:winhacks_21/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff013C38).withOpacity(0.8),
            elevation: 10.0,
            title: Text(
              'Third Eye',
              style: GoogleFonts.keaniaOne(color: Colors.white60),
            ),
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              indicator: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color(0xff036E70),
                    Color(0xff038E70),
                    Color(0xff005246),
                    Color(0xff038E70),
                    Color(0xff005246),
                  ])),
              tabs: [
                Tab(text: 'Absent in Class'),
                Tab(text: 'Activity'),
              ],
            ),
          ),
          drawer: userHomeDrawer(context),
          body: TabBarView(
            children: [
              AbsentScreen(),
              StatusScreen(),
            ],
          ),
        ),
      ),
    );
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
