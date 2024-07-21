import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider with ChangeNotifier {
  Locale _locale = const Locale(' ');

  Locale get locale => _locale;

  Future<void> setLocale(Locale newLocale) async {
    _locale = newLocale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLocale', newLocale.toString());
  }

  Future<void> initLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedLocale = prefs.getString('selectedLocale');

    if (selectedLocale != null) {
      _locale = Locale(selectedLocale);
    } else {
      _locale = const Locale('en'); // القيمة الافتراضية إذا لم يتم العثور على لغة محفوظة
    }

    notifyListeners();
  }
}