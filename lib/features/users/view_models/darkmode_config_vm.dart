import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/features/users/models/darkmode_config_model.dart';
import 'package:twitter_challenge/features/users/repos/darkmode_config_repo.dart';

class DarkModeConfigViewModel extends Notifier<DarkModeConfigModel> {
  final DarkModeConfigRepository _repository;

  DarkModeConfigViewModel(this._repository);

  void setDarkMode(bool dark) {
    _repository.setDarkMode(dark);
    state = DarkModeConfigModel(darkmode: dark);
  }

  @override
  DarkModeConfigModel build() {
    return DarkModeConfigModel(
      darkmode: _repository.isDarkMode(),
    );
  }
}

final darkmodeConfigProvider =
    NotifierProvider<DarkModeConfigViewModel, DarkModeConfigModel>(
  () => throw UnimplementedError(),
);
