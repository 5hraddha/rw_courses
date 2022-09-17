import '../../repository/repository.dart';
import '../../model/course.dart';

class CourseController {
  final Repository _repository;

  CourseController(this._repository);

  Future<List<Course>> fetchCourses(int domainFilter) {
    return _repository.getCourses(domainFilter);
  }
}
