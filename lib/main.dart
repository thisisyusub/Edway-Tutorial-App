import 'package:flutter/material.dart';

import './presentation/app.dart';
import 'locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  setup();

  runApp(MyApp());
}
