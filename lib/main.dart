import 'package:flutter/material.dart';

import './presentation/app.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(MyApp());
}
