class Course {
  final String courseId;
  final String name;
  final String description;
  final String difficulty;
  final String contributors;
  final String artworkUrl;

  Course(
    this.courseId,
    this.name,
    this.description,
    this.difficulty,
    this.contributors,
    this.artworkUrl,
  );

  // Named contructor returns an object of Course class using values from json
  Course.fromJson(Map<String, dynamic> json)
      : courseId = json['id'] as String,
        name = json['attributes']['name'] as String,
        description = json['attributes']['description_plain_text'] as String,
        difficulty = json['attributes']['difficulty'],
        contributors = json['attributes']['contributor_string'],
        artworkUrl = json['attributes']['card_artwork_url'];

  @override
  String toString() => name + ' : ' + difficulty;
}
