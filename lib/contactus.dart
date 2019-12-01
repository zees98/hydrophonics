import 'package:flutter/material.dart';
import 'package:hydrophonics/localization/localizations.dart';
import 'package:hydrophonics/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(20);
        var textStyle = TextStyle(fontSize: 16);
                return Scaffold(
                  appBar: AppBar(
                    title: Text(AppLocalizations.of(context).contactUs),
                    centerTitle: true,
                  ),
                  body: SingleChildScrollView(
                              child: Column(
                                
                      children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(AppLocalizations.of(context).contactus1, textAlign: TextAlign.justify, style: textStyle, ),
                         ),
                              
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              
                             Padding(
                          padding:  EdgeInsets.all(60),
                          child: Image.asset('assets/mohammad.png'),
                        ),
                        SizedBox(height: 40,),
                      Text(AppLocalizations.of(context).moreInfo),
                      GestureDetector(
                        onTap: (){
                          
                          launchWebsite();
                        },
                        child: Text("www.BasilGarden.net\n\n", textAlign: TextAlign.start, style: TextStyle(color: Colors.blueAccent),),
                      ),
                      Text(AppLocalizations.of(context).query),
                      Text("\nbasilgarden.smart@gmail.com", style: TextStyle(color: Colors.blueAccent)),
                      Image.asset("assets/logo1.jpg"),
                        Text(AppLocalizations.of(context).disclaimer,style: textStyle, textAlign: TextAlign.justify,),
                    ],
                  ),
                )
              ],
            ),
          )
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
