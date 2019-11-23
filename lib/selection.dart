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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0),
        title: Text("Smart Hydrophonics"),
        actions: <Widget>[
          Image.asset('assets/app_logo.png')
        ],
      ),
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
      body: Material(
        borderRadius: BorderRadius.circular(40),
        color: Colors.black38,
              child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  color: Colors.grey.shade800,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return CropScreen();
                  })),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image.asset('assets/crops.png'),
                        ),
                        Text(Utils.loc.chooseCrop)
                      ],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                                            child: FlatButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Fertilizer();
                        },
                      ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black38),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Image.asset('assets/fertilizer.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(AppLocalizations.of(context).viewFertilizaer),
                      ],
                  ),
                ),
                    ),
                Expanded(
                                    child: FlatButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Fertilizer();
                              },
                            ),
                          ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black45),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Image.asset('assets/customer-service.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(AppLocalizations.of(context).contactUs),
                          ])),
                )
                  ],
                )
              ],
            ),
          ),
        ),
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
