import 'package:flutter/material.dart';
import 'package:hydrophonics/localization/localizations.dart';

class ContactUS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).contactUs),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Image.asset("assets/app_logo.png")),
             Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white)),
                  child: Text(
                    "Smart Hydrophonics",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white)),
                  child: Text(
                    "www.BasilGarden.net",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "OpenSans", fontSize: 50),
                  ),
                ),
              )
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}
