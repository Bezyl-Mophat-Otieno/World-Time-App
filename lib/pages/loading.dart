import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/WorldTime.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // using try Catch block for error handling
 String time = 'loading';
  // creating a method that instantiates the world time class
  void setUpWorldTime () async{
    try{
      WorldTime instance = WorldTime(location: 'nairobi',url: '/Africa/Nairobi',flag: 'kenya.png');
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location':instance.location,
        'flag':instance.flag,
        'time':await instance.getTime(),
        'hour':await instance.getHour()
      });

    }catch(e){
      print(e);
    }


  }

  @override
  void initState() {
    setUpWorldTime();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Text('World Time App'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
