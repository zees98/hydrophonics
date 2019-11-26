import 'package:flutter/material.dart';
import 'package:hydrophonics/localization/localizations.dart';
import 'package:hydrophonics/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(20);
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).contactUs),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(tag: "logo", child: Image.asset("assets/app_logo.png")),
                Material(
                  borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
              color: Colors.black,
                            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ListTile(
                    leading: Tab(icon: Image.asset("assets/enterprise.png"),),
                    title: Text("Smart Hydrophonics"),
                  ),
                  ListTile(
                    onTap: launchWebsite,
                    leading: Tab(icon: Image.asset("assets/website.png"),),
                    title: Text("www.BasilGarden.net"),
                  )
                ],
              ),
            )
          ],
          ),
        ),
    );
  }

  launchWebsite() async {
    const url = 'https://basilgarden.net/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }
}
