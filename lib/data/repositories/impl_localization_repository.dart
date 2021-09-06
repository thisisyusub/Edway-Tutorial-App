import 'package:multiple_result/multiple_result.dart';
import 'dart:ui';
import 'dart:io';

import '../contractors/i_localization_repository.dart';
import '../failures.dart';
import '../../locator.dart';
import '../data_sources/preferences_data_source.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImplLocalizationRepository implements ILocalizationRepository {
  final _preferencesDataSource = getIt.getAsync<PreferencesDataSource>();

  @override
  Future<Result<LocalizationFailure, dynamic>> saveSelectedLangage(
    String languageCode,
  ) async {
    try {
      final _prefDataSource = await _preferencesDataSource;
      await _prefDataSource.putLanguageCode(languageCode);
      return Success(null);
    } catch (_) {
      return Error(LocalizationFailure());
    }
  }

  @override
  Future<Result<LocalizationFailure, String>> get currentLanguage async {
    try {
      // userin secimi
      final _prefDataSource = await _preferencesDataSource;
      var currentLanguageCode = _prefDataSource.languageCode;

      // user hec vaxt secmeyibse
      if (currentLanguageCode == null) {
        // telefonun dili
        final phoneLocale = Locale(Platform.localeName);

        if (AppLocalizations.supportedLocales.contains(phoneLocale)) {
          currentLanguageCode = phoneLocale.languageCode;
        } else {
          currentLanguageCode = 'az';
        }
      }

      return Success(currentLanguageCode);
    } catch (_) {
      return Error(LocalizationFailure());
    }
  }
}
