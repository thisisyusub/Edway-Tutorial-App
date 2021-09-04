import 'package:edway_tutorial_app/blocs/localization/localization_bloc.dart';
import 'package:edway_tutorial_app/data/contractors/i_localization_repository.dart';
import 'package:edway_tutorial_app/data/failures.dart';
import 'package:multiple_result/multiple_result.dart';

class MockLocalizationRepository implements ILocalizationRepository {
  String _selectedLanguage = 'az';

  @override
  Future<Result<LocalizationFailure, String>> get currentLanguage async {
    return Success(_selectedLanguage);
  }

  @override
  Future<Result<LocalizationFailure, void>> saveSelectedLangage(
      String languageCode) async {
    _selectedLanguage = languageCode;
    return Success(null);
  }
}

void main() {
  final localizationBloc = LocalizationCubit(MockLocalizationRepository());
  print(localizationBloc.state);
  localizationBloc.changeLanguage('en');
  print(localizationBloc.state);
}
