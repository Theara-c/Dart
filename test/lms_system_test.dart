import 'dart:math';

import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  test('creates a student', () {
    final lms = LmsSystem();

    // Create a student
    lms.addStudent(studentId: 'S1', studentName: "ronan");
    lms.addStudent(studentId: 'S2', studentName: "ninja");
    lms.addCourse(courseId: "C001", courseName: "Algo");
    lms.addCourse(courseId: "C002", courseName: "Algo");

    // expect(lms.students.first.name, 'ronan');


    //Task 2
    lms.enrollStudent(studentId: "S1", courseId: "C001");
    // expect(lms.courses[0].studentIds.length, 1);
    // expect(lms.students[0].enrollCourse.length, 1);
    // lms.discardStudentFromCourse(studentId: "S1", courseId: "C001");
    // expect(lms.courses[0].studentIds.length, 0);
    // expect(lms.students[0].enrollCourse.length, 0);
    //Task 4
    lms.addResult(studentId: "S1", courseId: "C001", score: 50);
    lms.addResult(studentId: "S1", courseId: "C001", score: 100);
    // lms.addResult(studentId: "S2", courseId: "C001", score: 50);// error part
    // lms.addResult(studentId: "S1", courseId: "C001", score: 500); // error part

    //Task 5
    lms.removeResult(studentId: "S1", courseId: "C001");
    // print(lms.results.length);
    expect(lms.results,isEmpty);


    // Remove the student
    // lms.removeStudent(studentId: 'S1');
    // expect(lms.students.length, 0);
  });
}
