import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagechangeController extends ChangeNotifier {
  Locale? _applocale;

  Locale? get applocle => _applocale;

  void ChangeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _applocale = type ;
    if (type == Locale('en')) {
      await sp.setString('language_code', 'en');
    } else {
      await sp.setString('language_code', 'en');
    }
    notifyListeners();
  }
}
