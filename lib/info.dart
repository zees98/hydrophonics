import 'package:flutter/material.dart';
import 'package:hydrophonics/constants.dart';

class ResultScreen extends StatefulWidget {
  final String crop;

  const ResultScreen({Key key, this.crop}) : super(key: key);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String crop;
  List<String> icons = ['idea.png', 'drop.png', 'hot.png'];
  List<String> columns = ['Lightning Hours', 'Humidity', 'Temperature'];
  List<String> coulmn1 = ['pH', 'EC' , 'PPM']; 
  List<String> images1 = ['ph.png', 'biomass.png', 'flask.png'];
  List<String> column2 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      crop = widget.crop;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Optimal Conditions'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: Text(widget.crop, style: TextStyle(fontSize: 30), textAlign: TextAlign.start,)),
                  Expanded(child: Image.asset('assets/${widget.crop.toLowerCase()}.png'))
                ],
              ) ,
              SizedBox(height: 20,),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 28.0,
                    horizontalMargin: 1,
                    columns: columns.map<DataColumn>((val) {
                     int imgIndex = columns.indexOf(val);
                      return DataColumn(
                          label: Row(
              mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(val),

                        Image.asset('assets/${icons[imgIndex]}', height: 25,)
                        ],
                      ));
                    }).toList(),
                    rows: [
                      DataRow(
                          cells: [
                        optimalEnv[crop][0],
                        optimalEnv[crop][1],
                        optimalEnv[crop][2]
                      ].map((val) {
                        return DataCell(Center(child: Text(val)));
                      }).toList())
                    ],
                  ),
                ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 28.0,
                  columns: coulmn1.map((val){
                    return DataColumn(label: Center(child: Row(
                      children: <Widget>[
                        Text(val),
                        Image.asset('assets/${images1[coulmn1.indexOf(val)]}', height: 25,)
                      ],
                    ),));
                  }).toList(),
                  rows: [DataRow(
                    cells: optimalChem[crop].toList().map((val){
                      return DataCell(Text(val));
                  }).toList(), 
                  )]
                ),
              ),
              DataTable(
                columns: ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
