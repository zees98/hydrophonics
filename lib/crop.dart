import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrophonics/concentration.dart';
import 'package:hydrophonics/localization/localizations.dart';
import 'package:hydrophonics/water.dart';
import 'constants.dart';

class CropScreen extends StatefulWidget {
  @override
  _CropScreenState createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> locales = Translations.locale(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
        title: Text(AppLocalizations.of(context).selectACrop),
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
                      Expanded(child: Text(locales[val]))
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WaterAnalysis(
                        crop: val,
                      );
                    })),
                    child: Text('Yes'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ConcentrationScreen();
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

class Translations {
  static Map<String, String> chemTranslation(BuildContext context) {
    return {
      'Lightning Hours': AppLocalizations.of(context).light,
      'Humidity': AppLocalizations.of(context).humid,
      'Temperature': AppLocalizations.of(context).temperature,
      'pH': AppLocalizations.of(context).ph,
      'EC': AppLocalizations.of(context).ec,
      'PPM': AppLocalizations.of(context).ppm,
      'Nitrogen': AppLocalizations.of(context).nitrogen,
      'Phosphorus': AppLocalizations.of(context).phosphorus,
      'Potassium': AppLocalizations.of(context).potassium,
      'Calcium': AppLocalizations.of(context).calcium,
      'Magnesium': AppLocalizations.of(context).magnesium,
      'Sulphur': AppLocalizations.of(context).sulphur,
      'Ammonium' : AppLocalizations.of(context).ammonium,
      'Nitrate' : AppLocalizations.of(context).nitrate,
      'Sulphate' : AppLocalizations.of(context).sulphate,
      'Phosphate' : AppLocalizations.of(context).phosphate
      
    };
  }

  static Map<String, String> locale(BuildContext context) {
    return {
      "Tomato": AppLocalizations.of(context).tomato,
      "Lettuce": AppLocalizations.of(context).lettuce,
      "Basil": AppLocalizations.of(context).basil,
      "Cucumber": AppLocalizations.of(context).cucumber,
      "Pepper": AppLocalizations.of(context).pepper,
      "Strawberry": AppLocalizations.of(context).strawberry,
      "Roses": AppLocalizations.of(context).roses,
      "Melon": AppLocalizations.of(context).melon,
      "Spinach": AppLocalizations.of(context).spinach,
      "Herbs": AppLocalizations.of(context).herbs,
    };
  }

  static Map<String, String> tankTranslate(BuildContext context) {
    print(AppLocalizations.of(context).boric);
    return {
      "Calcium Nitrate (15-0-0)": AppLocalizations.of(context).calNitrate,
      "Potassium Nitrate (13-0-46)": AppLocalizations.of(context).potNitrate,
      "Fe EDTA 13%": AppLocalizations.of(context).feEDTA,
      "Potassium Sulphate (0-0-50)": AppLocalizations.of(context).potSulphate,
      "Magnesium Sulphate": AppLocalizations.of(context).magSulphate,
      "Mono Potassium Phosphate (0-52-34)": AppLocalizations.of(context).monoPotPhosphate,
      "Ammonium Sulphate (21-0-0)": AppLocalizations.of(context).ammoSulphate,
      "Mn EDTA 13%": AppLocalizations.of(context).mnEDTA,
      "Zn EDTA 15%": AppLocalizations.of(context).znEDTA,
      "Cu EDTA 14%": AppLocalizations.of(context).cuEDTA,
      "Boric Acid": AppLocalizations.of(context).boric,
      "Sodium Molybdate": AppLocalizations.of(context).sodMoly,
    };
  }
}
