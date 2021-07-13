import 'package:flutter/foundation.dart';

class CountryCategory extends ChangeNotifier {
  String? _country;
  String? _countryname;
  String? _category;

  String get country => this._country.toString();
  String get countryname => this._countryname.toString();
  String get category => this._category.toString();

  set country(String value) {
    if (value.isNotEmpty) {
      _country = value;
      notifyListeners();
    }
  }

  set countryname(String value) {
    if (value.isNotEmpty) {
      _countryname = value;
      notifyListeners();
    }
  }

  set category(String value) {
    if (value.isNotEmpty) {
      _category = value;
      notifyListeners();
    }
  }

  CountryCategory(this._country, this._countryname, this._category);
}
