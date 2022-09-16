import 'package:flutter/material.dart';

import 'app.dart';
import 'strings.dart';

void main() => (MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Colors.green[800]),
      home: const App(),
    ));
