import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ActivityState();
}

class ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SiMotor'),
        centerTitle: true,
      ),
      body: Text('Activity', textAlign: TextAlign.center),
    );
  }
}