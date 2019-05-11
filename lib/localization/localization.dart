import 'dart:async';

import 'package:additive_food/localization/translations/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message('Additive Food', name: 'title');
  }

  String get additiveList {
    return Intl.message('Additive List', name: 'additiveList');
  }

  String get dontHaveAnAccount {
    return Intl.message('Don\'t have an account?', name: 'dontHavAnAccount');
  }

  String get login {
    return Intl.message('login', name: 'login');
  }

  String get password {
    return Intl.message('password', name: 'password');
  }

  String get signIn {
    return Intl.message('sign in', name: 'signIn');
  }

  String get signUp {
    return Intl.message('sign up', name: 'signUp');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
