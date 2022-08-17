import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/provider/test_provider/model/user_model.dart';

class UserModelProvider with ChangeNotifier {
  UserModel _model;
  UserModelProvider(this._model);

  UserModel get user => _model;
  set user(UserModel model) {
    _model = model;
    notifyListeners();
  }
}
