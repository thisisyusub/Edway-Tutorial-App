import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../blocs/paths/paths_bloc.dart';
import '../select_language/select_language_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.homePage),
        actions: [
          IconButton(
            onPressed: () {
              // todo: change to named router
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) {
                  return SelectLangaugePage();
                }),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocBuilder<PathsCubit, PathsState>(
        builder: (context, state) {
          if (state is PathsInProgress) {
            return Center(child: CupertinoActivityIndicator());
          } else if (state is PathsFailure) {
            return Center(child: Text('Failure!'));
          } else if (state is PathsSuccess) {
            final paths = state.paths;

            return ListView.builder(
              itemBuilder: (context, index) {
                final path = paths[index];

                return ListTile(
                  title: Text(path.normalizedName ?? path.name!),
                  subtitle: Text(path.description ?? ''),
                );
              },
              itemCount: paths.length,
            );
          }

          return SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(localizations.add),
        onPressed: () async {},
      ),
    );
  }
}
