import 'package:multiple_result/multiple_result.dart';
import '../failures.dart';

abstract class ILocalizationRepository {
  Future<Result<LocalizationFailure, void>> saveSelectedLangage(
      String languageCode);

  Future<Result<LocalizationFailure, String>> get currentLanguage;
}
