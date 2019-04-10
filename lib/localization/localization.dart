import 'dart:async';

import 'package:additive_food/localization/translations/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Localization {
  static Future<Localization> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new Localization();
    });
  }

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  String get title {
    return Intl.message('Hello world App',
        name: 'title', desc: 'The application title');
  }

  String get hello {
    return Intl.message('Hello', name: 'hello');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<Localization> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<Localization> load(Locale locale) {
    return Localization.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) {
    return false;
  }
}
