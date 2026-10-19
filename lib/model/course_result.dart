class CourseResult {
  // static int _resultId = 0;
  final String studentId;
  final String courseId;
  final List<int> score = [];

  CourseResult({required this.studentId, required this.courseId}) {
    // _resultId++;
  }
  //  int get resultId => _resultId;
}
