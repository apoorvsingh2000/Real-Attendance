import 'package:flutter/material.dart';
import 'package:winhacks_21/screens/entered_screen.dart';
import 'package:winhacks_21/screens/present_screen.dart';
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
              'Winhacks',
              style: TextStyle(color: Colors.white60),
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
                Tab(text: 'Entered in Class'),
                Tab(text: 'Actually Present'),
              ],
            ),
          ),
          drawer: userHomeDrawer(context),
          body: TabBarView(
            children: [
              EnteredScreen(),
              PresentScreen(),
            ],
          ),
        ),
      ),
    );
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
