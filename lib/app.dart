import 'package:flutter/material.dart';
import 'strings.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
        title: Text(Strings.appTitle),
      )),
    );
  }
}
