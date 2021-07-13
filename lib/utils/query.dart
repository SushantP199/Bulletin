import 'package:flutter/foundation.dart';

class Query extends ChangeNotifier {
  String? _q;

  Query(this._q);

  String get q => this._q.toString();

  set q(String value) {
    this._q = value;
    notifyListeners();
  }
}
