import 'dart:io';

import 'package:flutter/material.dart';
import '../data/data.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //For fetching data

  void loadData() async {
    CovidData instance = CovidData();
    WorldData instancee = WorldData();

    await instance.getData();
    await instancee.getData();

    //Passing Data to another page.
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'infected': instance.infected,
      'active': instance.active,
      'recovered': instance.recovered,
      'death': instance.death,
      'dateTime': instance.dateTime,
      'winfected': instancee.infected,
      'wactive': instancee.active,
      'wrecovered': instancee.recovered,
      'wdeath': instancee.death,
    });
  }

  // void checkConnection() async {
  //   try {
  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       print('connected to internet');
  //       Center(
  //         child: Text('Internet Done'),
  //       );
  //     }
  //   } on SocketException catch (_) {
  //     print('not connected');
  //     Center(
  //       child: Text('No Internet'),
  //     );
  //   }
  // }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // checkConnection();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[500],
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
