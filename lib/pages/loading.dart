import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    //Create a WorldInstance and use it to get the time
    WorldTime instance = WorldTime(location: 'London', flag:'germany.png', url:'Europe/Berlin');
    await instance.getTime();

    //Go to home with the location, flag and time routed in arguents
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
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
        child: Text("LOADING..."),
      ),
    );
  }
}
