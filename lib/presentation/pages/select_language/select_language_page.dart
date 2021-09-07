import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/localization/localization_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectLangaugePage extends StatelessWidget {
  const SelectLangaugePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationBloc = context.watch<LocalizationCubit>();
    final currentLangCode = localizationBloc.state;
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.selectLangauge),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            value: currentLangCode == 'en',
            title: Text('English'),
            onChanged: (_) {
              localizationBloc.changeLanguage('en');
            },
          ),
          CheckboxListTile(
            value: currentLangCode == 'az',
            title: Text('Azerbaijani'),
            onChanged: (_) {
              localizationBloc.changeLanguage('az');
            },
          ),
          CheckboxListTile(
            value: currentLangCode == 'ru',
            title: Text('Russian'),
            onChanged: (_) {
              localizationBloc.changeLanguage('ru');
            },
          ),
        ],
      ),
    );
  }
}
