import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../model/course.dart';
import '../../repository/course_repository.dart';
import './courses_controller.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CourseController(CourseRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: _controller.fetchCourses(Constants.allFilter),
      builder: (context, snapshot) {
        final courses = snapshot.data;
        if (snapshot.hasData) {
          return Text(courses.toString());
        }
        if (snapshot.hasError) {
          return const Text('Uh!Oh! Some error occured.');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
