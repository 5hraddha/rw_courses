import '../../repository/repository.dart';
import '../../repository/course_repository.dart';
import '../../model/course.dart';

class CourseController {
  final Repository _repository = CourseRepository();

  Future<List<Course>> fetchCourses(int domainFilter) {
    return _repository.getCourses(domainFilter);
  }
}
