import 'package:flutter/material.dart';
import 'package:study_flutter/provider/test_provider/model/phone_model.dart';

class PhoneModelProvider with ChangeNotifier {
  PhoneModel _model;

  PhoneModelProvider(this._model);

  PhoneModel get model => _model;
  set model(PhoneModel model) {
    _model = model;
    notifyListeners();
  }
}
