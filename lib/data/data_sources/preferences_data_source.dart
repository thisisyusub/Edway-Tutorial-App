import 'package:hive/hive.dart';

class PreferencesDataSource {
  static late final Box _preferencesBox;
  final _languageCode = 'languageCode';

  static Future<PreferencesDataSource> init() async {
    if (!Hive.isBoxOpen('preferencesBox')) {
      _preferencesBox = await Hive.openBox('preferencesBox');
    }

    return PreferencesDataSource();
  }

  Future<void> putLanguageCode(String languageCode) {
    return _preferencesBox.put(_languageCode, languageCode);
  }

  String? get languageCode => _preferencesBox.get(_languageCode);
}
