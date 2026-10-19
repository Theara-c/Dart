import 'package:lms_layered_architecture_example/model/course_result.dart';

import '../model/student.dart';
import '../model/course.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<CourseResult> results = [];

  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);
    // 2- Remove student from the course
    for (Course c in courses) {
      c.studentIds.remove(studentId);
    }
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  // Course Service
  void addCourse({required String courseId, required String courseName}) {
    Course? course = _findCourseOrNull(courseId);
    if (course != null) {
      throw Exception('Course $course already exists');
    }
    courses.add(Course(id: courseId, name: courseName));
  }

  void removeCourse(String courseId) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId is not exists');
    }
    if (course.studentIds.isNotEmpty) {
      throw Exception(
          "There are some student in this course! U cannot delete it ");
    }
    courses.remove(course);
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null; // not found
  }

  // Enrollment Service
  void enrollStudent({required String studentId, required String courseId}) {
    // check does this student and course is exist?
    Student? student = _getStudentOrThrow(studentId);
    Course? course = _getCourseOrThrow(courseId);
    // check duplicate student
    _ensureStudentIsNotEnrolled(student, course);

    course.studentIds.add(studentId);
    student.enrollCourse.add(courseId);
  }

  void discardStudentFromCourse(
      {required String studentId, required String courseId}) {
    // check does student and course is exist?
    Student? student = _getStudentOrThrow(studentId);
    Course? course = _getCourseOrThrow(courseId);
    // check their existing
    _ensureStudentIsEnrolled(student, course);

    course.studentIds.removeWhere((s) => s == studentId);
    student.enrollCourse.removeWhere((s) => s == courseId);
  }

  // Result service
  void addResult(
      {required String studentId,
      required String courseId,
      required int score}) {
    // check does student and course is exist?
    Student? student = _getStudentOrThrow(studentId);
    Course? course = _getCourseOrThrow(courseId);
    // check their existing
    _ensureStudentIsEnrolled(student, course);
    // check the score range between 0 t0 100
    if (score < 0 || score > 100) throw Exception("Score range 0-100 only");
    // check it existing
    CourseResult? r =
        _findExistingResult(studentId: studentId, courseId: courseId);
    if (r == null) {
      r = CourseResult(studentId: studentId, courseId: courseId);
      r.score.add(score);
      results.add(r);
    } else
      r.score.add(score);
  }

  void removeResult({required String studentId, required String courseId}) {
    Student? student = _getStudentOrThrow(studentId);
    Course? course = _getCourseOrThrow(courseId);
    // check their existing
    _ensureStudentIsEnrolled(student, course);
    CourseResult? r =
        _findExistingResult(studentId: studentId, courseId: courseId);
    if (r == null) {
      throw Exception(
          "This student $studentId has not result in course $courseId");
    }
    results
        .removeWhere((e) => e.studentId == studentId && e.courseId == courseId);
  }

  // Helper function
  Student _getStudentOrThrow(String studentId) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception("This Student $studentId does not exist");
    }
    return student;
  }

// Helper for Course
  Course _getCourseOrThrow(String courseId) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception("This course $courseId does not exist");
    }
    return course;
  }

// Helper to check and ensure a student is enrolled in a course
  void _ensureStudentIsEnrolled(Student student, Course course) {
    if (!course.studentIds.contains(student.id) ||
        !student.enrollCourse.contains(course.id)) {
      throw Exception(
          "This student is not enrolled in this course (${course.id})");
    }
  }

  void _ensureStudentIsNotEnrolled(Student student, Course course) {
    if (course.studentIds.contains(student.id) ||
        student.enrollCourse.contains(course.id)) {
      throw Exception(
          "This student is already enrolled in this course (${course.id})");
    }
  }

  CourseResult? _findExistingResult(
      {required String studentId, required String courseId}) {
    for (var r in results) {
      if (r.studentId == studentId && r.courseId == courseId) {
        return r;
      }
    }
    return null; // Return null if no matching result is found
  }
}
