import 'package:flutter/material.dart';
import 'package:hydrophonics/concentration.dart';
import 'package:hydrophonics/crop.dart';
import 'package:hydrophonics/info.dart';
import 'package:hydrophonics/localization/localizations.dart';
import 'package:hydrophonics/main.dart';
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
                      crop = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CropScreen();
                      }));
                      print(crop);
                    },
                    title: Text(AppLocalizations.of(context).chooseCrop),
                    trailing: Image.asset("assets/crops.png"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radius,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.all(20),
                  child: ListTile(
                    onTap: () async {
                      wA = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return WaterAnalysis();
                      }));
                      if (wA != null)
                        wA.forEach((k, v) {
                          print("$k : $v");
                        });
                    },
                    title: Text(AppLocalizations.of(context).waterAnalysis),
                    trailing: Image.asset("assets/drop.png"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: radius,
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.all(20),
                  child: ListTile(
                    onTap: () async {
                      conn = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ConcentrationScreen();
                      }));
                      print(conn);
                    },
                    title: Text(AppLocalizations.of(context).concentration),
                    trailing: Image.asset("assets/test-tube.png"),
                  ),
                )
              ],
            ),
            Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        print(conn);
                        print(crop);

                        if ((conn == null && crop == null)) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Missing data"),
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "Crop (Required)\n\nWater Analysis (Optional) \n\nConcentration Factor (Required)"),
                                  ),
                                  actions: <Widget>[
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: radius),
                                      color: Colors.black54,
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("OK"),
                                    )
                                  ],
                                );
                              });
                          return;
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ResultScreen(
                              crop: crop,
                              waterAnalysis: wA,
                              concentration: conn == null ? 0.0 : conn,
                            );
                          }));
                        }
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: radius),
                      child: Text(AppLocalizations.of(context).startgrowing,
                          style: TextStyle(color: Colors.black)),
                    ),
                    Text("www.BasilGarden.net")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
