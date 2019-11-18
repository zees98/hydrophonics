import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hydrophonics/crop.dart';
import 'package:hydrophonics/fertilizer.dart';
import 'package:hydrophonics/localization/localizations.dart';
import 'package:hydrophonics/main.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings),
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertBox();
              });

          setState(() {});
        },
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Material(
            elevation: 3.0,
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(790, 500),
              topLeft: Radius.elliptical(800, 580),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CropScreen();
                    })),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Image.asset('assets/crops.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(Utils.loc.chooseCrop)
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Fertilizer();
                        },
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(AppLocalizations.of(context).viewFertilizaer),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Image.asset('assets/fertilizer.png'),
                              ),
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
        ],
      ),
    );
  }
}

class AlertBox extends StatefulWidget {
  AlertBox({
    Key key,
  }) : super(key: key);

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Settings'),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                  Utils.prefs.getString("lang") == "en" ? "Arabic" : "English"),
              Switch(
                value: false,
                onChanged: (val) {
                  setState(() {
                    String lang = Utils.prefs.getString("lang") ?? "en";
                    if (lang == "en") {
                      Utils.prefs.setString("lang", "ar");
                    } else {
                      Utils.prefs.setString("lang", "en");
                    }
                    print(Utils.prefs.getString("lang"));
                    AppLocalizations.load(
                        Locale(Utils.prefs.getString("lang"), ""));
                    Navigator.of(context).pop();
                  });
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
