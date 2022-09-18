import 'package:flutter/material.dart';
import 'strings.dart';
import 'ui/courses/courses_page.dart';
import 'ui/filter/filter_page.dart';
import 'state/filter_state_container.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterStateContainer(
      child: MaterialApp(
          title: Strings.appTitle,
          debugShowCheckedModeBanner: false,
          theme: Theme.of(context).copyWith(
            appBarTheme: Theme.of(context).appBarTheme.copyWith(
                  backgroundColor: Colors.green[800],
                ),
          ),
          home: Builder(
            builder: (context) => SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(Strings.appTitle),
                  actions: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FilterPage()),
                          );
                        },
                        icon: const Icon(Icons.filter_list)),
                  ],
                ),
                body: const CoursesPage(),
              ),
            ),
          )),
    );
  }
}
