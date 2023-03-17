// import the dependencies for the class : http and Converter
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  //declaring the data fields
  String location; // Location for the UI
  String url; // URL endpoint for getting the time
  String flag;// flag representation of the specific location 


  WorldTime({required this.location, required this.url, required this.flag}); //Time of the specific location

  // Named constructor




  Future<String> getTime () async{
    String time;
    final response = await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);
    // print(data);
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(dateTime);
    //  print(offset);
    // Convert the date string into datetime object

    DateTime now = DateTime.parse(dateTime);

    now = now.add(Duration(hours: int.parse(offset)));
     time = DateFormat.jm().format(now);/**/

     return time;
    // print(time);
  }

  Future<int>getHour() async{
    final response = await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);
    // print(data);
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    DateTime now = DateTime.parse(dateTime);

    now = now.add(Duration(hours: int.parse(offset)));
    return now.hour ;

  }
  // create sample instance of the worldTime class

}