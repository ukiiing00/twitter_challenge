import 'package:flutter/material.dart';
import 'package:twitter_challenge/features/users/models/darkmode_config_model.dart';
import 'package:twitter_challenge/features/users/repos/darkmode_config_repo.dart';

class DarkModeConfigViewModel extends ChangeNotifier {
  final DarkModeConfigRepository _repository;

  DarkModeConfigViewModel(this._repository);

  late final DarkModeConfigModel _model = DarkModeConfigModel(
    darkmode: _repository.isDarkMode(),
  );

  bool get dark => _model.darkmode;

  void setDarkMode(bool dark) {
    _repository.setDarkMode(dark);
    _model.darkmode = dark;
    notifyListeners();
  }
}
