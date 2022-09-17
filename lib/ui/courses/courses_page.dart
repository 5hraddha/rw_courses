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
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: courses!.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildRow(courses[index]);
            },
          );
        }
        if (snapshot.hasError) {
          return const Text('Uh!Oh! Some error occured.');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildRow(Course course) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.green[50],
        contentPadding: const EdgeInsets.all(16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            course.name,
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 16.0,
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text(course.domainString),
        ),
        trailing: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(course.artworkUrl)),
      ),
    );
  }
}
