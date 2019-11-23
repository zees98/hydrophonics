import 'package:flutter/material.dart';
import 'package:hydrophonics/concentration.dart';
import 'package:hydrophonics/crop.dart';
import 'package:hydrophonics/info.dart';
import 'package:hydrophonics/water.dart';

class SecondMenu extends StatefulWidget {
  @override
  _SecondMenuState createState() => _SecondMenuState();
}

class _SecondMenuState extends State<SecondMenu> {
  String crop;
  Map<String, double> wA;
  double conn;
  @override
  Widget build(BuildContext context) {
    var radius = BorderRadius.circular(20);
    return Scaffold(
      // backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text("Smart Hydrophonics"),
        centerTitle: true,
        actions: <Widget>[Image.asset("assets/app_logo.png")],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radius,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.all(20),
                  child: ListTile(
                    onTap: () async {
                      crop = await Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return CropScreen();
                        }
                        
                      ));
                      print(crop);
                    },
                    title: Text("Choose Crop"),
                    trailing: Image.asset("assets/crops.png"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radius,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.all(20),
                  child: ListTile(
                    onTap: () async{
                     wA = await  Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return WaterAnalysis();
                        }
                      
                      ));
                     if(wA != null) wA.forEach((k,v){
                        print("$k : $v");
                      });
                    },
                    title: Text("Water Analysis"),
                    trailing: Image.asset("assets/drops.png"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radius,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.all(20),
                  child: ListTile(
                    onTap: () async{
                       conn = await  Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return ConcentrationScreen();
                        }
                      
                      ));
                      print(conn);
                    },
                    title: Text("Concentration Factor"),
                    trailing: Image.asset("assets/crops.png"),
                  ),
                )
              ],
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: FlatButton(
                onPressed: (conn != null && wA != null && conn != null)?() => Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return ResultScreen(
                      crop: crop,
                      waterAnalysis: wA,
                      concentration: conn == null? 0.0 : conn,
                    );
                  }
                )): () {},
                
                color: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: radius),
                child: Text("Start Growing",
                    style: TextStyle(color: Colors.black)),
              )
            )
          ],
        ),
      ),
    );
  }
}
