import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrophonics/localization/localizations.dart';
//import 'package:hydrophonics/message.dart';
import 'package:hydrophonics/selection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static SharedPreferences prefs;
  static AppLocalizations loc;
}

void main() async {
  Utils.prefs = await SharedPreferences.getInstance();
  String language = Utils.prefs.getString("lang") ?? "en";
  print(language);
  runApp(
    MaterialApp(
      theme: ThemeData.dark()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.black54)),
      home: SplashScreen(),
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      locale: Locale(Utils.prefs.getString("lang") ?? "en"),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return SelectionScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    Utils.loc = AppLocalizations.of(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/app_logo.png'),
              radius: 150,
            ),
          ),
        ],
      ),
    ));
  }
}
