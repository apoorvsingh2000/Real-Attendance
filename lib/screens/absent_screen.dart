import 'package:flutter/material.dart';
import 'package:winhacks_21/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AbsentScreen extends StatefulWidget {
  @override
  _AbsentScreenState createState() => _AbsentScreenState();
}

class _AbsentScreenState extends State<AbsentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('attendance').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green[900],
            ),
          );
        }
        List absentList = [], timeList = [], strengthList = [];
        final items = snapshot.data.docs;
        for (var item in items) {
          final time = item.data()['Time'];
          final student = item.data()["Student_Absent"];
          final strength = item.data()['Strength'];
          print(time);
          absentList.add(student);
          timeList.add(time);
          strengthList.add(strength);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: absentList.length,
            itemBuilder: (_, index) {
              return Card(
                margin: const EdgeInsets.all(3),
                color: Colors.white60,
                child: ListTile(
                  leading: Text(
                    timeList[index],
                    style: kHeadingTextStyle,
                  ),
                  title: Text(
                    absentList[index],
                    style: kHeadingTextStyle,
                  ),
                  trailing: Text(
                    strengthList[index],
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
