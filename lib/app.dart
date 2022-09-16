import 'package:flutter/material.dart';
import 'strings.dart';
import 'ui/courses/courses_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: Colors.green[800],
            ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(Strings.appTitle),
          ),
          body: const CoursesPage(),
        ),
      ),
    );
  }
}
