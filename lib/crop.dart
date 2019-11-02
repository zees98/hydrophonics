import 'package:flutter/material.dart';
import 'package:hydrophonics/main.dart';
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
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => SplashScreen()
          )),
        ),
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
              children: images.map<Widget>((val) {
                return MaterialButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => WaterAnalysis(crop: val)
                  )),
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
}
