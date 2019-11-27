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
    return Intl.message('Water Analysis (PPM)', name: 'waterAnalysis');
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
    return Intl.message("Lightning \nhours", name: 'light');
  }

  String get humid {
    return Intl.message("Humidity \n%", name: 'humid');
  }

  String get temperature {
    return Intl.message("Temperature \n°C", name: 'temperature');
  }

  String get ph {
    return Intl.message("pH", name: 'ph');
  }

  String get ec {
    return Intl.message("EC\nms\\cm", name: 'ec');
  }

  String get ppm {
    return Intl.message("TDS \nPPM", name: 'ppm');
  }

  String get suggested {
    return Intl.message("Suggested Nutrient Solution (PPM)", name: 'suggested');
  }

  String get nitrogen {
    return Intl.message("Nitrogen", name: 'nitrogen');
  }

  String get ammonium {
    return Intl.message("Ammonium", name: 'ammonium');
  }

  String get phosphate {
    return Intl.message("Phosphate", name: 'phosphate');
  }

  String get phosphorus {
    return Intl.message("Phosphorus", name: 'phosphorus');
  }

  String get potassium {
    return Intl.message("Potassium", name: 'potassium');
  }

  String get calcium {
    return Intl.message("Calcium", name: 'calcium');
  }

  String get magnesium {
    return Intl.message("Magnesium", name: 'magnesium');
  }

  String get sulphur {
    return Intl.message("Sulphur", name: 'sulphur');
  }

  String get nitrate {
    return Intl.message("Nitrate", name: 'nitrate');
  }

  String get sulphate {
    return Intl.message("Sulphate", name: 'sulphate');
  }

  String get tankA {
    return Intl.message("Tank A", name: 'tankA');
  }

  String get tankB {
    return Intl.message("Tank B", name: 'tankB');
  }

  String get fertilizer {
    return Intl.message("Fertilizer", name: 'fertilizer');
  }

  String get quantity {
    return Intl.message("Quantity \ngram", name: 'quantity');
  }

  String get calNitrate {
    return Intl.message("Calcium Nitrate", name: 'calNitrate');
  }

  String get potNitrate {
    return Intl.message("Potassium Nitrate", name: 'potNitrate');
  }

  String get feEDTA {
    return Intl.message("Fe EDTA 13%", name: 'feEDTA');
  }

  String get potSulphate {
    return Intl.message("Potassium Sulphate", name: 'potSulphate');
  }

  String get magSulphate {
    return Intl.message("Magnesium Sulphate", name: 'magSulphate');
  }

  String get monoPotPhosphate {
    return Intl.message("Mono Potassium Phosphate", name: 'monoPotPhosphate');
  }

  String get ammoSulphate {
    return Intl.message("Ammonium Phosphate", name: 'ammoSulphate');
  }

  String get mnEDTA {
    return Intl.message("Mn EDTA 13%", name: 'mnEDTA');
  }

  String get znEDTA {
    return Intl.message("Zn EDTA 15%", name: 'znEDTA');
  }

  String get cuEDTA {
    return Intl.message("Cu EDTA 14%", name: 'cuEDTA');
  }

  String get boric {
    return Intl.message("Boric Acid", name: 'boric');
  }

  String get sodMoly {
    return Intl.message("Sodium Molybdate", name: 'sodMoly');
  }
  ////////////////////////////////////////////////////////////

  String get calciumNitrate {
    return Intl.message("Calcium Nitrate", name: 'calciumNitrate');
  }

  String get ammoniumSulphate {
    return Intl.message("Ammonium Sulphate", name: 'ammoniumSulphate');
  }

  String get magnesiumSulphateH {
    return Intl.message("Magnesium Sulphate (Heptahydrate)",
        name: 'magnesiumSulphateH');
  }

  String get monopotPhosphate {
    return Intl.message("Mono Potassium Phosphate", name: 'monopotPhosphate');
  }

  String get potassiumNitrate {
    return Intl.message("Potassium Nitrate", name: 'potassiumNitrate');
  }

  String get potassiumSulphate {
    return Intl.message("Potassium Sulphate", name: 'potassiumSulphate');
  }
  ////////////////////////////////////////////////

  String get tNitrogen {
    return Intl.message("Total Nitrogen", name: 'tNitrogen');
  }

  String get sulfur {
    return Intl.message("Sulfur (S)", name: 'sulfur');
  }

  String get calciumCa {
    return Intl.message("Calcium (Ca)", name: 'calciumCa');
  }

  String get magnesiumMg {
    return Intl.message("Magnesium (Mg)", name: 'magnesiumMg');
  }

  String get phosphorusP {
    return Intl.message("Phosphorus (P)", name: 'phosphorusP');
  }

  String get potassiumK {
    return Intl.message("Potassium (K)", name: 'potassiumK');
  }

  String get sulphateS {
    return Intl.message("Sulphate (S)", name: 'sulphateS');
  }

  ////////////////////////////////////////////////////////////
  String get formula {
    return Intl.message("Formula", name: 'formula');
  }

  String get appearance {
    return Intl.message("Appearance", name: 'appearance');
  }

  String get solubility {
    return Intl.message("Solubility (in20 c)", name: 'solubility');
  }

  String get density {
    return Intl.message("Density", name: 'density');
  }

  String get mass {
    return Intl.message("Molar Mass", name: 'mass');
  }

  /////////////////////////////////////////////////////////////
  String get whitegranular {
    return Intl.message("White Crystal or granular", name: 'whitegranular');
  }

  String get hygroscopic {
    return Intl.message("White solid hygroscopic granules",
        name: 'hygroscopic');
  }

  String get crystalline {
    return Intl.message("White crystalline solid", name: 'crystalline');
  }

  String get powder {
    return Intl.message("White crystal powder", name: 'powder');
  }

  String get whitecrystalline {
    return Intl.message("White crystalline powder", name: 'whitecrystalline');
  }

  String get finepowder {
    return Intl.message("White fine crystalline powder", name: 'finepowder');
  }

  //White Crystal or granular
  String get volumeNote {
    return Intl.message(
        "The volume of plain water to be used with concentrated solution (m3)",
        name: 'volumeNote');
  }
  String get volumeWater {
    return Intl.message(
        "Volume of Water (m3)",
        name: 'volumeWater');
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
