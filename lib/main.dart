import 'package:flutter/material.dart';
import 'package:hydrophonics/crop.dart';


main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(appBarTheme: AppBarTheme(color: Colors.black54)),
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1) , (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return CropScreen();
      })
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
                child: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
              radius: 150,
            )),
            
          ],
        ),
      ),
    );
  }
}
