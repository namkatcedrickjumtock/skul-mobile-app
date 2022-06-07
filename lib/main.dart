import 'package:flutter/material.dart';
import 'package:hibmat/views/screens/about_hibmat.dart';
import 'package:hibmat/views/screens/announcements.dart';
import 'package:hibmat/views/screens/complaints.dart';
import 'package:hibmat/views/screens/deadlines.dart';
import 'package:hibmat/views/screens/grading.dart';
import 'package:hibmat/views/screens/lecturer_dashboard.dart';
import 'package:hibmat/views/screens/loading.dart';
import 'package:hibmat/views/screens/my_courses.dart';
import 'package:hibmat/views/screens/my_results.dart';
import 'package:hibmat/views/screens/my_timetable.dart';
import 'package:hibmat/views/screens/school%20Calendar.dart';
import 'package:hibmat/views/screens/student_dashboard.dart';
import 'package:hibmat/views/screens/create_account.dart';
import 'package:hibmat/views/screens/menu.dart';
import 'package:hibmat/views/screens/sign_in.dart';

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hibmat Buea",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.grey[800],
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: AboutHibmat(),

        // _--_--_--_--_--_--_--_--_--_--_--_--_
        initialRoute: '/loading',
        routes: {
          '/loading': (context) => Loading(),
          '/createAccount': (context) => CreateAccount(),
          '/studentDashboard': (context) => StudentDashboard(),
          '/signIn': (context) => SignIn(),
          '/lecturerDashboard': (context) => LecturerDashboard(),
          '/menu': (context) => Menu(),
          '/myCourses': (context) => MyCourses(),
          '/myTimetable': (context) => MyTimetable(),
          '/myResults': (context) => MyResults(),
          '/announcements': (context) => Announcements(),
          '/complaints': (context) => Complaints(),
          '/calendar': (context) => Calendar(),
          '/deadlines': (context) => Deadlines(),
          '/aboutHibmat': (context) => AboutHibmat(),
          '/grading': (context) => Grading(),
        }
        //_--_--_--_--_--_--_--_--_--_--_--_--_

        );
  }
}
