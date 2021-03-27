import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:winhacks_21/utilities/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

class EnteredScreen extends StatefulWidget {
  @override
  _EnteredScreenState createState() => _EnteredScreenState();
}

class _EnteredScreenState extends State<EnteredScreen> {
  List<List<dynamic>> _data = [];

  @override
  void initState() {
    _loadCSV();
    super.initState();
  }

  Future<String> downloadFile() async {
    File downloadCsv;
    await firebase_storage.FirebaseStorage.instance.ref().putFile(downloadCsv);
    print("ooooooooffffffff$downloadCsv");
    return downloadCsv.path;
  }

  Future<void> _loadCSV() async {
    final _rawData = await rootBundle.loadString('assets/Attendance_Stats.csv');
    print("ooooooooffffffff");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
    print(_data);
  }

  @override
  Widget build(BuildContext context) {
    return _data == null
        ? CircularProgressIndicator(
            backgroundColor: Color(0xff013C38),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (_, index) {
                return Card(
                  margin: const EdgeInsets.all(3),
                  color: index == 0
                      ? Color(0xff038E70).withOpacity(0.5)
                      : Colors.white60,
                  child: ListTile(
                    leading: Text(
                      _data[index][0].toString(),
                      style: index == 0 ? kHeadingTextStyle : TextStyle(),
                    ),
                    title: Text(
                      _data[index][1],
                      style: index == 0 ? kHeadingTextStyle : TextStyle(),
                    ),
                    trailing: Text(
                      _data[index][2].toString(),
                      style: index == 0 ? kHeadingTextStyle : TextStyle(),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
