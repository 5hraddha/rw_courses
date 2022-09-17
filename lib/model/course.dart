class Course {
  final String courseId;
  final String name;
  final String description;

  Course(this.courseId, this.name, this.description);

  // Named contructor returns an object of Course class using values from json
  Course.fromJson(Map<String, dynamic> json)
      : courseId = json['id'] as String,
        name = json['attributes']['name'] as String,
        description = json['attributes']['description_plain_text'] as String;

  @override
  String toString() => name;
}
