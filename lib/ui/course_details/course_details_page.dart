import 'package:flutter/material.dart';
import '../../model/course.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(course.name),
        ),
        body: Text(course.description),
      ),
    );
  }
}
