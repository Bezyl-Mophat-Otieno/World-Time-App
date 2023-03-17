import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
Map data = {};
  final counter =0;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['hour'] >6 && data['hour'] < 20 ? 'day.jpg' : 'night.jpg';
    print(bgImage);
    Color bgColor = data['hour'] > 6 && data['hour'] < 20 ? Colors.black : Colors.black;
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
              padding: const EdgeInsets.fromLTRB(0,0,0,0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        child: Icon(Icons.location_on , size: 40,),
                        onPressed: () {
                          Navigator.pushNamed(context, '/location');
                        },
                      ),
                      Text('Location',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Droid Sans",
                          fontSize: 25,
                          color: Colors.blue[900]

                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 200),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(data['location'],
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 33,
                        color: Colors.white,
                      ),
                      ),
                      SizedBox(height:20),
                      Text(data['time'],
                      style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 40,
                        color: Colors.white

                      ),)
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
