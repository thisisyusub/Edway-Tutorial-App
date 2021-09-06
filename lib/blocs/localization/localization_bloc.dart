import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/contractors/i_localization_repository.dart';

class LocalizationCubit extends Cubit<String> {
  LocalizationCubit(this.localizationRepository) : super('en');

  final ILocalizationRepository localizationRepository;

  void initLocale() async {
    final result = await localizationRepository.currentLanguage;

    if (result.isSuccess()) {
      emit(result.getSuccess()!);
    } else {
      emit('az');
    }
  }

  void changeLanguage(String languageCode) async {
    if (languageCode == state) return;

    final result =
        await localizationRepository.saveSelectedLangage(languageCode);

    if (result.isSuccess()) {
      emit(languageCode);
    }
  }
}
