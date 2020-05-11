import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //Placeholder texst wile we fetch and process API request
  String time = "Loading...";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'London', flag:'germany.png', url:'Europe/Berlin');
    await instance.getTime();
    print('THE TIME IS: ${instance.time}');
    setState ((){
      time = instance.time;
    });
  }

  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
