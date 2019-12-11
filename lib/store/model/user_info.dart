import 'package:flutter/foundation.dart' show ChangeNotifier;

class UserModel with ChangeNotifier {
  String _userId;
  String _userName;

  String get userId => _userId;
  String get userName => _userName;

  UserModel(this._userId, this._userName);

  void update(String uid,String name) {
    _userId = uid;
    _userName = name;
    notifyListeners();
  }
}
