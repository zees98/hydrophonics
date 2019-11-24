import 'package:hydrophonics/i18n/messages_all.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get chooseCrop {
    return Intl.message('Choose Crop', name: 'chooseCrop');
  }

  String get concentration {
    return Intl.message('Concentration Factor', name: 'concentration');
  }

  String get missing {
    return Intl.message("Missing data", name: 'missing');
  }

  String get waterAnalysis {
    return Intl.message('Water Analysis', name: 'waterAnalysis');
  }

  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs');
  }

  String get startgrowing {
    return Intl.message('Start Growing', name: 'startgrowing');
  }

  String get viewFertilizaer {
    return Intl.message('View Fertilizers', name: 'viewFertilizaer');
  }

  String get selectACrop {
    return Intl.message('Select a Crop', name: 'selectACrop');
  }

  String get addwater {
    return Intl.message('Add Water Analysis?', name: 'addwater');
  }

  String get yes {
    return Intl.message('Yes', name: 'yes');
  }

  String get no {
    return Intl.message('No', name: 'no');
  }

  String get tomato {
    return Intl.message("Tomato", name: "tomato");
  }

  String get lettuce {
    return Intl.message("Lettuce", name: "lettuce");
  }

  String get basil {
    return Intl.message("Basil", name: 'basil');
  }

  String get cucumber {
    return Intl.message("Cucumber", name: 'cucumber');
  }

  String get pepper {
    return Intl.message("Pepper", name: 'pepper');
  }

  String get strawberry {
    return Intl.message("Strawberry", name: 'strawberry');
  }

  String get roses {
    return Intl.message("Roses", name: 'roses');
  }

  String get melon {
    return Intl.message("Melon", name: 'melon');
  }

  String get spinach {
    return Intl.message("Spinach", name: 'spinach');
  }

  String get herbs {
    return Intl.message("Herbs", name: 'herbs');
  }

  String get light {
    return Intl.message("Lightning Hours", name: 'light');
  }

  String get humid {
    return Intl.message("Humidity", name: 'humid');
  }

  String get temperature {
    return Intl.message("Temperature", name: 'temperature');
  }

  String get ph {
    return Intl.message("pH", name: 'ph');
  }

  String get ec {
    return Intl.message("EC", name: 'ec');
  }

  String get ppm {
    return Intl.message("PPM", name: 'ppm');
  }
  
  String get suggested {
    return Intl.message("Suggested Nutrient Solution", name: 'suggested');
  }
  String get nitrogen {
    return Intl.message("Nitrogen", name: 'nitrogen');
  }
  String get phosphorus {
    return Intl.message("Phosphorus", name: 'phosphorus');
  }
  String get potassium {
    return Intl.message("Potassium", name: 'potassium');
  }
  String get calcium {
    return Intl.message("Nitrogen", name: 'nitrogen');
  }
  String get magnesium {
    return Intl.message("Phosphorus", name: 'phosphorus');
  }
  String get sulphur {
    return Intl.message("Potassium", name: 'potassium');
  }
  
   String get tankA {
    return Intl.message("Tank A", name: 'tankA');
  }
  String get tankB {
    return Intl.message("Tank B", name: 'tankB');
  }
  
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) {
    return false;
  }
}
