import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hydrophonics/contactus.dart';
import 'package:hydrophonics/crop.dart';
import 'package:hydrophonics/fertilizer.dart';
import 'package:hydrophonics/localization/localizations.dart';
import 'package:hydrophonics/main.dart';
import 'package:hydrophonics/secondmenu.dart';
import 'package:hydrophonics/sizeconfig.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var textStyle = TextStyle(fontSize: (16/ 411 ) * SizeConfig.screenWidth );
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return SplashScreen();
                }
              )),
            ),
            centerTitle: true,
            title: Text("Smart Hydrophonics"),
            actions: <Widget>[
              Hero(tag: "logo", child: Image.asset('assets/app_logo.png'))
            ],
          ),
          floatingActionButton: Container(
            height: (40 / 774) * SizeConfig.screenHeight,
            child: FloatingActionButton(
              
              child: Icon(Icons.settings, size:  (30 / 774) * SizeConfig.screenHeight,),
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertBox();
                    });
    
                setState(() {});
              },
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SecondMenu();
                        })),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Image.asset(
                                  'assets/startgrowing.png',
                                  height: SizeConfig.screenHeight * 0.2,
                                ),
                              ),
                              Text(AppLocalizations.of(context).startgrowing,
                                style: textStyle,
                          )
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
                                height: (150/ 774) * SizeConfig.screenHeight,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black38),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Image.asset('assets/fertilizer.png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: (30/ 774) * SizeConfig.screenHeight,
                              ),
                              Text(
                                  AppLocalizations.of(context).viewFertilizaer, style: textStyle,),
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
                                      return ContactUS();
                                    },
                                  ),
                                ),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: (150/ 774) * SizeConfig.screenHeight,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black45),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Image.asset(
                                            'assets/customer-service.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: (30/ 774) * SizeConfig.screenHeight,
                                  ),
                                  Text(AppLocalizations.of(context).contactUs, style: textStyle,),
                                ])),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Text('www.BasilGarden.net'))
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
                activeColor: Colors.blue,
                value: Utils.prefs.getString("lang") == 'en' ? true : false,
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
