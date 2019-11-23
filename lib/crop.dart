import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrophonics/concentration.dart';
import 'package:hydrophonics/water.dart';
import 'constants.dart';

class CropScreen extends StatefulWidget {
  @override
  _CropScreenState createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
        title: Text('Select a Crop'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              children: optimalEnv.keys.toList().map<Widget>((val) {
                return MaterialButton(
                  onPressed: () {
                   Navigator.pop(context, val);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child:
                              Image.asset('assets/${val.toLowerCase()}.png')),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(child: Text(val))
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Future buildShowDialog(BuildContext context, String val) {
    return showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text("Add Water Analysis?"),
                          children: <Widget>[
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () => Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context){
                                          return WaterAnalysis(crop: val,);
                                        }
                                      )),
                                  child: Text('Yes'),
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                       return ConcentrationScreen() ;
                                    }));
                                  },
                                  child: Text('No'),
                                )
                              ],
                            )
                          ],
                        );
                      });
  }
}
