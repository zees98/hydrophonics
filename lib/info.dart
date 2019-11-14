import 'package:flutter/material.dart';
import 'package:hydrophonics/constants.dart';
import 'package:hydrophonics/water.dart';
import 'dart:math' as Math;

class ResultScreen extends StatefulWidget {
  final String crop;
  final Map<String, double> waterAnalysis;
  const ResultScreen({Key key, this.crop, this.waterAnalysis})
      : super(key: key);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String crop;

  List<String> icons = ['idea.png', 'drop.png', 'hot.png'];
  List<String> columns = ['Lightning Hours', 'Humidity', 'Temperature'];
  List<String> coulmn1 = ['pH', 'EC', 'PPM'];
  List<String> images1 = ['ph.png', 'biomass.png', 'flask.png'];
  List<String> column2 = [
    'Nitrogen',
    'Phosphorus',
    'Potassium',
    'Calcium',
    'Magnesium',
    'Sulphur'
  ];

  Map<String, double> balance;
  void initConversion() {
    List<double> wA = widget.waterAnalysis != null
        ? widget.waterAnalysis.values.toList()
        : [0, 0, 0, 0, 0, 0, 0];
    List<double> result = suggestedNutrients[crop];

    balance = {
      'Nitrate': (result[0] * (62 / 14) * 0.9) - wA[0],
      'Ammonium': (result[0] * (18 / 14) * 0.1) - wA[1],
      'Phosphate': (result[1] * (95 / 31)) - wA[2],
      'Potassium': (result[2] - wA[3]),
      'Calcium': (result[3] - wA[4]),
      'Magnesium': (result[4] - wA[5]),
      'Sulphate': (result[5] * (96 / 32)) - wA[6]
    };
    print('Suggested Solution');
    result.forEach((f) {
      print(f);
    });
    print('Water Analysis');
    wA.forEach((k) {
      print(k);
    });
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    setState(() {
      crop = widget.crop;
    });
    //checkMethod();
    initConversion();

  }

  checkMethod() {
    tanks().forEach((f, v) {
      print("Key: $f, Value: $v");
    });
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 20, fontFamily: 'OpenSans');
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
                  Expanded(
                      child: Text(
                    widget.crop,
                    style: TextStyle(fontSize: 50, fontFamily: 'OpenSans'),
                    textAlign: TextAlign.start,
                  )),
                  Expanded(
                      child: Image.asset(
                          'assets/${widget.crop.toLowerCase()}.png'))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
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
                                Image.asset(
                                  'assets/${icons[imgIndex]}',
                                  height: 25,
                                )
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
                            columnSpacing:
                                MediaQuery.of(context).size.width * 0.2,
                            columns: coulmn1.map((val) {
                              return DataColumn(
                                  label: Center(
                                child: Row(
                                  children: <Widget>[
                                    Text(val),
                                    Image.asset(
                                      'assets/${images1[coulmn1.indexOf(val)]}',
                                      height: 25,
                                    )
                                  ],
                                ),
                              ));
                            }).toList(),
                            rows: [
                              DataRow(
                                cells: optimalChem[crop].toList().map((val) {
                                  return DataCell(Text(val));
                                }).toList(),
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Suggested Nutrient Solution (PPM)',
                          style: textStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DataTable(
                          headingRowHeight: 0,
                          dataRowHeight: 70,
                          columnSpacing: MediaQuery.of(context).size.width / 20,
                          horizontalMargin: 20,
                          columns: [1, 2, 3].map((val) {
                            return DataColumn(label: Container());
                          }).toList(),
                          rows: suggestedNutrients[crop].map((val) {
                            List<double> list = suggestedNutrients[crop];
                            return DataRow(cells: [
                              DataCell(Image.asset(
                                  'assets/${chemLabels[list.indexOf(val)]}')),
                              DataCell(Text(column2[list.indexOf(val)])),
                              DataCell(Text(val.toString())),
                            ]);
                          }).toList()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Tank A",
                          textAlign: TextAlign.center,
                          style: textStyle.copyWith(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Map<String, double> catIons() {
    return {
      'Ammonium': balance['Ammonium'] / 18.04,
      'Potassium': balance['Potassium'] / 39.1,
      'Calcium': balance['Calcium'] / 40.08,
      'Magnesium': balance['Magnesium'] / 24.31
    };
  }

  Map<String, double> anIons() {
    return {
      'Nitrate': balance['Nitrate'] / 62,
      'Sulphate': balance['Sulphate'] / 96,
      'Phosphate': balance['Phosphate'] / 95,
      'Chloride': 0.0
    };
  }

  Map<String, double> tanks() {
   // initConversion();
    print('Balance PPM');
    balance.forEach((k, v) {
      print(v);
    });

    Map<String, double> cat = catIons();
    print('CatIons');
    cat.forEach((k, v) {
      print('Cation: $k, Value: $v');
    });

    Map<String, double> an = anIons();
    print('anIons');
    an.forEach((k, v) {
      print('Anion: $k, Value: $v');
    });
    print('Molarity');
    Map<String, double> res = {
      'Calcium Nitrate': cat['Calcium'] * 216.1,
      'Magnesium Sulphate': cat['Magnesium'] * 246.4,
      'Mono Potassium Sulfate': an['Phosphate'] * 136.1,
    };
    res['Ammonium Sulphate'] = ((cat['Ammonium'] - cat['Calcium'] * 0.2) / 2) * 132.14;
    res['Potassium Sulfate'] =
        (an['Sulphate'] - res['Ammonium Sulphate'] - res['Magnesium Sulphate']) * 174.3;
    res['Potassium Nitrate'] = (cat["Potassium"] - res['Potassium Sulfate'] * 2) * 101.1;
    return res;
  }
}
