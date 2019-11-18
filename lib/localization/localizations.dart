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
    return Intl.message(
      'Choose Crop',
      name: 'chooseCrop',
    );
  }

  String get viewFertilizaer {
    return Intl.message(
      'View Fertilizers',
      name: 'viewFertilizaer',
    );
  }

  String get selectACrop {
    return Intl.message(
      'Select a Crop',
      name: 'selectACrop',
    );
  }

  String get addwater {
    return Intl.message(
      'Add Water Analysis?',
      name: 'addwater',
    );
  }

  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
    );
  }

  String get no {
    return Intl.message(
      'No',
      name: 'no',
    );
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
