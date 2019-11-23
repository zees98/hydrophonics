import 'package:flutter/material.dart';
import 'package:hydrophonics/info.dart';
import 'package:hydrophonics/water.dart';

class ConcentrationScreen extends StatefulWidget {
  final Map<String, double> wA;
  final String crop;

  const ConcentrationScreen({Key key, this.wA, this.crop}) : super(key: key);
  @override
  _ConcentrationScreenState createState() => _ConcentrationScreenState();
}

class _ConcentrationScreenState extends State<ConcentrationScreen> {
  Map<String, double> wateranalysis;
  @override
  void initState() {
    
    super.initState();
    wateranalysis = widget.wA == null ?{
    'Nitrate': 0.0,
    'Ammonium': 0.0,
    'Phosphate': 0.0,
    'Potassium': 0.0,
    'Calcium': 0.0,
    'Magnesium': 0.0,
    'Sulphate': 0.0,
   
  } : widget.wA;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Concentration Factor"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (newVal) {
                
                setState(() {
                    wateranalysis["Volume of Water (m3)"] = newVal == null? 0.0: double.parse(newVal);
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Volume of Water (m3)"),
            ),
          ),
          FlatButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResultScreen(
                crop: widget.crop,
                waterAnalysis: wateranalysis,
              );
            })),
            child: Text(
              "Start Growing",
              style: TextStyle(color: Colors.black),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
