import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../blocs/auth/auth_bloc.dart';
import '../data/contractors/i_auth_repository.dart';
import '../data/repositories/impl_auth_repository.dart';
import 'pages/auth/auth_page.dart';
import 'pages/home/home_page.dart';
import '../blocs/localization/localization_bloc.dart';
import '../data/repositories/impl_localization_repository.dart';
import '../data/contractors/i_localization_repository.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IAuthRepository>(
      create: (_) => ImplAuthRepository(),
      child: RepositoryProvider<ILocalizationRepository>(
        create: (_) => ImplLocalizationRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(
                context.read<IAuthRepository>(),
              )..checkAuth(),
            ),
            BlocProvider(create: (context) {
              return LocalizationCubit(
                context.read<ILocalizationRepository>(),
              )..initLocale();
            }),
          ],
          child: Builder(
            builder: (context) {
              return BlocBuilder<LocalizationCubit, String>(
                builder: (_, languageCode) {
                  return MaterialApp(
                    title: 'Flutter Demo',
                    locale: Locale(languageCode),
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    theme: ThemeData(
                      primarySwatch: Colors.deepPurple,
                    ),
                    home: AuthPage(),
                    onGenerateRoute: (routeSettings) {
                      switch (routeSettings.name) {
                        case '/home':
                          return MaterialPageRoute(
                            builder: (_) => HomePage(),
                          );
                        default:
                          return MaterialPageRoute(
                            builder: (_) => Scaffold(
                              body: Center(
                                child: Text(
                                  'Page with name ${routeSettings.name}'
                                  ' is not defined!',
                                ),
                              ),
                            ),
                          );
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
