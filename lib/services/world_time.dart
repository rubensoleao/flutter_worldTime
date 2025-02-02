import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart' as intl;

class WorldTime {
  
  String location; //location name for the UI 
  String time; //time in that location
  String flag; //URL for the flag image asset
  String url; //location url for API endpoints
  
  bool isDaytime; // T or F if daytime or not
  
  //CONSTRUCTOR
  WorldTime({this.location,this.flag,this.url});
  Future<void> getTime() async {
    try {
      http.Response response = await http.get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get date property from data
      String datetime = data['datetime'];

      //Create DateTime
      DateTime now = DateTime.parse(datetime);

      // Set the time Property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = intl.DateFormat.jm().format(now);

    }

    catch (e){
      print('caught error: $e');
      time = 'Could not get time data';
    }
  }

}

