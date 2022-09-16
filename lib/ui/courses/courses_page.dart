import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../model/course.dart';
import './courses_controller.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CourseController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: _controller.fetchCourses(Constants.allFilter),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Text('RW Courses');
      },
    );
  }
}
