import 'package:flutter/material.dart';
import '../../model/course.dart';
import '../../utils/string_extensions.dart';
import 'image_container.dart';

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
        // https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.green[50],
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildBanner(),
                    _buildMain(context),
                    _buildDetails(context),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBanner() {
    return Hero(
      tag: 'courseArtwork-${course.courseId}',
      child: ImageContainer(
        height: 200,
        url: course.artworkUrl,
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              course.name,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontSize: 24,
                    color: Colors.green[900],
                  ),
            ),
          ),
          Text(
            course.description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    const style = TextStyle(fontSize: 16.0);

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Domain(s): ${course.domainString}',
            style: style,
          ),
          Text(
            'Level: ${course.difficulty.capitalize()}',
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '${course.contributors}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
          )
        ],
      ),
    );
  }
}
