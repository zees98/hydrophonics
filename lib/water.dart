import 'package:flutter/material.dart';
import 'package:hydrophonics/concentration.dart';
import 'package:hydrophonics/crop.dart';
import 'package:hydrophonics/info.dart';
import 'package:hydrophonics/localization/localizations.dart';

class WaterAnalysis extends StatefulWidget {
  final String crop;

  const WaterAnalysis({Key key, this.crop}) : super(key: key);

  @override
  _WaterAnalysisState createState() => _WaterAnalysisState();
}

class _WaterAnalysisState extends State<WaterAnalysis> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, double> wateranalysis = {
    'Nitrate': 0.0,
    'Ammonium': 0.0,
    'Phosphate': 0.0,
    'Potassium': 0.0,
    'Calcium': 0.0,
    'Magnesium': 0.0,
    'Sulphate': 0.0,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(AppLocalizations.of(context).waterAnalysis),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/app_logo.png'),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: wateranalysis.keys.map<Widget>((val) {
                  //print('$val: ${}');
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
                    child: TextFormField(
                      validator: (text) {
                        if (text.isNotEmpty) {
                          double value = double.parse(text);
                          return value <= 0
                              ? "Please enter a value above 0"
                              : value > 300
                                  ? "Please enter a value Below 300"
                                  : null;
                        } else {
                          return null;
                        }
                      },
                      expands: false,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: Translations.chemTranslation(
                              context)[val.trim()]),
                      onChanged: (newValue) {
                        setState(() {
                          wateranalysis[val] = double.parse(newValue);
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate())
                    Navigator.pop(context, wateranalysis);
                },
                child: Text('Proceed'),
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Text(
              "www.BasilGarden.net",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
