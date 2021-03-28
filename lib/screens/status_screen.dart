import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:winhacks_21/utilities/constants.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('csv').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green[900],
            ),
          );
        }
        List activityList = [], dateList = [], timeList = [];
        final items = snapshot.data.docs;
        for (var item in items) {
          final time = item.data()['Time'];
          final activity = item.data()['Activity'];
          final date = item.data()['Date'];
          print(time);
          timeList.add(time);
          activityList.add(activity);
          dateList.add(date);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: timeList.length,
            itemBuilder: (_, index) {
              return Card(
                margin: const EdgeInsets.all(3),
                color: Colors.white60,
                child: ListTile(
                  leading: Text(
                    dateList[index],
                    style: kHeadingTextStyle,
                  ),
                  title: Text(
                    timeList[index],
                    style: kHeadingTextStyle,
                  ),
                  trailing: Text(
                    activityList[index],
                    style: kHeadingTextStyle,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
