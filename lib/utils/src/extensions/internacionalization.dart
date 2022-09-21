import 'dart:ui';

import 'package:fatima/fatima_interface.dart';

import 'package:fatima/fatima.dart';

// import '../../../get_core/get_core.dart';

class _IntlHost {
  Locale? locale;

  Locale? fallbackLocale;

  Map<String, Map<String, String>> translations = {};
}

extension FirstWhereExt<T> on List<T> {
  /// The first element satisfying [test], or `null` if there are none.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension LocalesIntl on FatimaInterface {
  static final _intlHost = _IntlHost();

  Locale? get locale => _intlHost.locale;

  Locale? get fallbackLocale => _intlHost.fallbackLocale;

  set locale(Locale? newLocale) => _intlHost.locale = newLocale;

  set fallbackLocale(Locale? newLocale) => _intlHost.fallbackLocale = newLocale;

  Map<String, Map<String, String>> get translations => _intlHost.translations;

  void addTranslations(Map<String, Map<String, String>> tr) {
    translations.addAll(tr);
  }

  void clearTranslations() {
    translations.clear();
  }

  void appendTranslations(Map<String, Map<String, String>> tr) {
    tr.forEach((key, map) {
      if (translations.containsKey(key)) {
        translations[key]!.addAll(map);
      } else {
        translations[key] = map;
      }
    });
  }
}

extension Trans on String {
  // Checks whether the language code and country code are present, and
  // whether the key is also present.
  bool get _fullLocaleAndKey {
    return Fatima.translations.containsKey(
            "${Fatima.locale!.languageCode}_${Fatima.locale!.countryCode}") &&
        Fatima.translations[
                "${Fatima.locale!.languageCode}_${Fatima.locale!.countryCode}"]!
            .containsKey(this);
  }

  // Checks if there is a callback language in the absence of the specific
  // country, and if it contains that key.
  Map<String, String>? get _getSimilarLanguageTranslation {
    final translationsWithNoCountry = Fatima.translations
        .map((key, value) => MapEntry(key.split("_").first, value));
    final containsKey = translationsWithNoCountry
        .containsKey(Fatima.locale!.languageCode.split("_").first);

    if (!containsKey) {
      return null;
    }

    return translationsWithNoCountry[
        Fatima.locale!.languageCode.split("_").first];
  }

  String get tr {
    // print('language');
    // print(Fatima.locale!.languageCode);
    // print('contains');
    // print(Fatima.translations.containsKey(Fatima.locale!.languageCode));
    // print(Fatima.translations.keys);
    // Returns the key if locale is null.
    if (Fatima.locale?.languageCode == null) return this;

    if (_fullLocaleAndKey) {
      return Fatima.translations[
              "${Fatima.locale!.languageCode}_${Fatima.locale!.countryCode}"]![
          this]!;
    }
    final similarTranslation = _getSimilarLanguageTranslation;
    if (similarTranslation != null && similarTranslation.containsKey(this)) {
      return similarTranslation[this]!;
      // If there is no corresponding language or corresponding key, return
      // the key.
    } else if (Fatima.fallbackLocale != null) {
      final fallback = Fatima.fallbackLocale!;
      final key = "${fallback.languageCode}_${fallback.countryCode}";

      if (Fatima.translations.containsKey(key) &&
          Fatima.translations[key]!.containsKey(this)) {
        return Fatima.translations[key]![this]!;
      }
      if (Fatima.translations.containsKey(fallback.languageCode) &&
          Fatima.translations[fallback.languageCode]!.containsKey(this)) {
        return Fatima.translations[fallback.languageCode]![this]!;
      }
      return this;
    } else {
      return this;
    }
  }

  String trArgs([List<String> args = const []]) {
    var key = tr;
    if (args.isNotEmpty) {
      for (final arg in args) {
        key = key.replaceFirst(RegExp(r'%s'), arg.toString());
      }
    }
    return key;
  }

  String trPlural([String? pluralKey, int? i, List<String> args = const []]) {
    return i == 1 ? trArgs(args) : pluralKey!.trArgs(args);
  }

  String trParams([Map<String, String> params = const {}]) {
    var trans = tr;
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        trans = trans.replaceAll('@$key', value);
      });
    }
    return trans;
  }

  String trPluralParams(
      [String? pluralKey, int? i, Map<String, String> params = const {}]) {
    return i == 1 ? trParams(params) : pluralKey!.trParams(params);
  }
}
