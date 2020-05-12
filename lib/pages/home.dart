import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Stores data imported from loading screen
  Map data = {};

  @override
  Widget build(BuildContext context) {

    // Assign data gotten from loading screen

    data = ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color  bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor, 
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0 ),
            child: Column(children: <Widget>[
              FlatButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                label:Text(
                  'Edit Location',
                  style: TextStyle(
                    color:Colors.grey[300],
                  ),
                ),
                icon: Icon(
                  Icons.edit_location,
                  color:Colors.grey[300],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color:Colors.white,
                  ),
                ),
              ],),
            SizedBox(height: 20.0,),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 66.0,
                color:Colors.white,
              ),
            )
            ],),
          ),
        )
      ),
      
    );
  }
}