import 'package:flutter/material.dart';
import 'package:hydrophonics/info.dart';

class WaterAnalysis extends StatefulWidget {
  final String crop;

  const WaterAnalysis({Key key, this.crop}) : super(key: key);

  @override
  _WaterAnalysisState createState() => _WaterAnalysisState();
}

class _WaterAnalysisState extends State<WaterAnalysis> {
  Map<String, double> wateranalysis = {
    'Nitrate': 0.0,
    'Ammonium': 0.0,
    'Phosphate': 0.0,
    'Potassium': 0.0,
    'Calcium': 0.0,
    'Magnesium': 0.0,
    'Sulphate': 0.0,
    'Volume of Water (mg/L)': 0.0
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:  () => Navigator.pop(context),),
        title: Text('Water Analysis'),
        actions: <Widget>[ Image.asset('assets/${widget.crop.toLowerCase()}.png')],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: wateranalysis.keys.map<Widget>((val) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0 , left: 8.0 , right: 8.0),
                  child: TextField(
                    expands: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      hintText: '$val'),
                    onChanged: (newValue) {
                      setState(() {
                        wateranalysis[val] = double.parse(val);
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: FlatButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return ResultScreen(crop: widget.crop);
                  }
                ));
              },
                child: Text('Proceed'),
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
