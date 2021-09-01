import 'package:flutter/material.dart';

import '../../../data/data_sources/dio_configuration.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Add'),
        onPressed: () async {
          try {
            // await crudDio.post(
            //   '/api/paths/add',
            //   data: <String, dynamic>{
            //     "name": "Become Flutter Developer",
            //     "description": "This is the total tutorial about Flutter",
            //     "accessibility": "Public",
            //     "severity": "test",
            //     "requirements": "test",
            //   },
            // );

            final result = await crudDio.get('/api/paths', queryParameters: {
              'offset': 0,
              'limit': 1000,
            });
            print(result.data);
          } catch (e, s) {
            print('$e => $s');
          }
        },
      ),
    );
  }
}
