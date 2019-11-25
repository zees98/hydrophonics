import 'package:flutter/material.dart';
import 'package:hydrophonics/constants.dart';
import 'package:hydrophonics/crop.dart';
import 'package:hydrophonics/localization/localizations.dart';
import 'package:hydrophonics/main.dart';
import 'package:hydrophonics/sizeconfig.dart';
import 'package:hydrophonics/water.dart';
import 'dart:math' as Math;

class ResultScreen extends StatefulWidget {
  final String crop;
  final Map<String, double> waterAnalysis;
  final concentration;
  const ResultScreen({Key key, this.crop, this.waterAnalysis, this.concentration})
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

  Map<String, double> res;
  Map<String, double> tankA, tankB;
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
      initConversion();
      res = tanks();
      tankA = {
        'Calcium Nitrate (15-0-0)': res['Calcium Nitrate'],
        'Potassium Nitrate (13-0-46)': res['Potassium Nitrate'] / 2,
        'Fe EDTA 13%': 30.77 * widget.concentration
      };
      tankB = {
        'Potassium Nitrate (13-0-46)': res["Potassium Nitrate"] / 2,
        'Potassium Sulphate (0-0-50)': res['Potassium Sulfate'],
        'Magnesium Sulphate': res['Magnesium Sulphate'],
        'Mono Potassium Phosphate (0-52-34)': res['Mono Potassium Phosphate'],
        'Ammonium Sulphate (21-0-0)': res["Ammonium Sulphate"],
        'Mn EDTA 13%': 7.7 * widget.concentration,
        'Zn EDTA 15%': 2.0 * widget.concentration,
        'Cu EDTA 14%': 1.0 * widget.concentration,
        'Boric Acid': 2.9 * widget.concentration,
        'Sodium Molybdate': 0.3 * widget.concentration
      };
    });
    res.forEach((f, v) {
      print("$f : $v");
    });
  }

  @override
  Widget build(BuildContext context) {
    
    var textStyle = TextStyle(fontSize: 20, fontFamily: 'OpenSans');
    Map<String, String> chemtrans = Translations.chemTranslation(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Hydrophonics'),
        centerTitle: true,
        actions: <Widget>[
          Image.asset("assets/app_logo.png")
        ],
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
                   Translations.locale(context)[crop],
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
                          columnSpacing: SizeConfig.screenWidth * 0.1,
                          horizontalMargin: 1,
                          columns: columns.map<DataColumn>((val) {
                            int imgIndex = columns.indexOf(val);
                            return DataColumn(
                                label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(chemtrans[val], textAlign: TextAlign.center,),
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
                              return DataCell(Center(child: Text(val, textAlign: TextAlign.center,)));
                            }).toList())
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                            columnSpacing: 
                                SizeConfig.screenWidth * 0.22,
                            horizontalMargin: 1,
                            columns: coulmn1.map((val) {
                              return DataColumn(
                                  label: Center(
                                child: Row(
                                  children: <Widget>[
                                    Text(chemtrans[val]),
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
                          AppLocalizations.of(context).suggested,
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
                              DataCell(Text(chemtrans[column2[list.indexOf(val)]])),
                              DataCell(Text(val.toStringAsFixed(0))),
                            ]);
                          }).toList()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppLocalizations.of(context).tankA,
                          textAlign: TextAlign.center,
                          style: textStyle.copyWith(fontSize: 24),
                        ),
                      ),
                      TankTable(
                        tankB: tankA,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppLocalizations.of(context).tankB,
                          textAlign: TextAlign.center,
                          style: textStyle.copyWith(fontSize: 24),
                        ),
                      ),
                      TankTable(tankB: tankB)
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
    //initConversion();
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
      'Calcium Nitrate': cat['Calcium'],
      'Magnesium Sulphate': cat['Magnesium'],
      'Mono Potassium Phosphate': an['Phosphate'],
    };
    res['Ammonium Sulphate'] = ((cat['Ammonium'] - (cat['Calcium'] * 0.2)) / 2);
    res['Potassium Sulfate'] =
        (an['Sulphate'] - res['Ammonium Sulphate'] - res['Magnesium Sulphate']);
    res['Potassium Nitrate'] =
        (cat["Potassium"] - res['Potassium Sulfate'] * 2 - an['Phosphate']);
    res.forEach((k, v) {
      print(v);
    });
    print(widget.concentration);
    res['Potassium Nitrate'] *= 101.1 * widget.concentration;
    res["Potassium Sulfate"] *= 174.3 * widget.concentration;
    res['Ammonium Sulphate'] *= 132.14 * widget.concentration;
    res['Calcium Nitrate'] *= 216.1 * widget.concentration;
    res['Magnesium Sulphate'] *= 246.4 * widget.concentration;
    res['Mono Potassium Phosphate'] *= 136.1 * widget.concentration;
    return res;
  }
}

class TankTable extends StatelessWidget {
  const TankTable({
    Key key,
    @required this.tankB,
  }) : super(key: key);

  final Map<String, double> tankB;

  @override
  Widget build(BuildContext context) {
    Map<String, String> tanktrans = Translations.tankTranslate(context);

    return DataTable(
      
        horizontalMargin: 0.0,
        columns: [AppLocalizations.of(context).fertilizer, AppLocalizations.of(context).quantity].map((f) {
          return DataColumn(label: Text(f, textAlign: TextAlign.center,));
        }).toList(),
        rows: tankB.keys.map((f) {
         
          return DataRow(
              cells: [tanktrans[f.trim()], tankB[f] < 0.0? "0": tankB[f].toStringAsFixed(0)].map((f) {
            return DataCell(
              Center(
                child: Text(
                  f,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList());
        }).toList());
  }
}
