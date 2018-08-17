import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class TranslationBase {
  TranslationBase(this.locale);

  final Locale locale;

  static TranslationBase of(BuildContext context) {
    return Localizations.of<TranslationBase>(context, TranslationBase);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Home',
      'subTitle': 'About',
      'language': 'العربية',
      'urgent': 'Urgent',
      'events': 'Events'
    },
    'ar': {
      'title': 'الرئيسية',
      'subTitle': 'عن الديوان',
      'language': 'English',
      'urgent': 'عاجل',
      'events': "الفعاليات"
    },
  };

  String get home {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get about {
    return _localizedValues[locale.languageCode]['subTitle'];
  }

  String get language {
    return _localizedValues[locale.languageCode]['language'];
  }

  String get urgent {
    return _localizedValues[locale.languageCode]['urgent'];
  }

  String get events {
    return _localizedValues[locale.languageCode]['events'];
  }
}

class TranslationBaseDelegate extends LocalizationsDelegate<TranslationBase> {
  const TranslationBaseDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<TranslationBase> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<TranslationBase>(TranslationBase(locale));
  }

  @override
  bool shouldReload(TranslationBaseDelegate old) => false;
}
