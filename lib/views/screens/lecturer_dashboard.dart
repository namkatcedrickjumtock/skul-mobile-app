import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:hibmat/views/components/background_img.dart';

class LecturerDashboard extends StatefulWidget {
  @override
  _LecturerDashboardState createState() => _LecturerDashboardState();
}

class _LecturerDashboardState extends State<LecturerDashboard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(image: 'assets/pictures/logo.jpg'),

          /// ListView
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(_w / 17, _w / 6, 0, _w / 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.blue[100],
                        radius: _w * .15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.5),
                          child: Image(
                              image: AssetImage('assets/pictures/award.jpg'),
                              fit: BoxFit.cover),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lecturer\'s Name',
                          style: TextStyle(
                            fontSize: _w * 0.07,
                            // color: Colors.black.withOpacity(.6),
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: _w * .01),
                        Text(
                          '####/HIBMAT/SC/DE/20YY',
                          style: TextStyle(
                            fontSize: _w * 0.04,
                            color: Colors.blueAccent[400],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: _w * .01),
                        Text(
                          'Level: X00',
                          style: TextStyle(
                            fontSize: _w * 0.05,
                            // color: Colors.black.withOpacity(.5),
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: _w * .01),
                        Text(
                          'Dep: \'my_department\'',
                          style: TextStyle(
                            fontSize: _w * 0.05,
                            // color: Colors.black.withOpacity(.5),
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              homePageCardsGroup(
                Color(0xFF0D250E),
                Icons.library_books,
                'My Courses',
                context,
                '/myCourses',
                Color(0xffFF6D6D),
                Icons.ballot,
                'My Timetable',
                '/myTimetable',
              ),
              homePageCardsGroup(
                  Colors.lightGreen,
                  Icons.receipt,
                  'Grading',
                  context,
                  '/grading',
                  Color(0xffffa700),
                  Icons.announcement,
                  'Make Announcement',
                  '/announcements'),
              homePageCardsGroup(
                  Color(0xff63ace5),
                  Icons.insert_comment,
                  'Complaints',
                  context,
                  '/complaints',
                  Color(0xfff37736),
                  Icons.calendar_today,
                  'School Calendar',
                  '/calendar'),
              homePageCardsGroup(
                  Color(0xffFF6D6D),
                  Icons.timer,
                  'Deadlines',
                  context,
                  '/deadlines',
                  Colors.lightGreen,
                  Icons.info_outline_rounded,
                  'About HIBMAT',
                  '/aboutHibmat'),
            ],
          ),

          /// NOTIFICATION ICON
          Padding(
            padding: EdgeInsets.fromLTRB(_w / 15, _w / 9.5, _w / 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('options');
                    HapticFeedback.lightImpact();
                    Navigator.pushNamed(context, '/menu');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(99)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        height: _w / 8.5,
                        width: _w / 8.5,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.menu_rounded,
                            size: _w / 17,
                            // color: Colors.black.withOpacity(.6),
                            color: Colors.red[100],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('notifications');
                    HapticFeedback.lightImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RouteWhereYouGo();
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(99)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        height: _w / 8.5,
                        width: _w / 8.5,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.notifications,
                            size: _w / 17,
                            // color: Colors.black.withOpacity(.6),
                            color: Colors.red[100],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Blur the Status bar
          blurTheStatusBar(context),
        ],
      ),
    );
  }

  Widget homePageCardsGroup(
      Color color,
      IconData icon,
      String title,
      BuildContext context,
      String route,
      Color color2,
      IconData icon2,
      String title2,
      String route2) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: _w / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          homePageCard(color, icon, title, context, route),
          homePageCard(color2, icon2, title2, context, route2),
        ],
      ),
    );
  }

  Widget homePageCard(Color color, IconData icon, String title,
      BuildContext context, String route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.pushNamed(context, route);
          },
          child: Container(
            padding: EdgeInsets.all(15),
            height: _w / 2.5,
            width: _w / 2.4,
            decoration: BoxDecoration(
              color: Colors.red[900].withOpacity(.9),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff040039).withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Container(
                  height: _w / 8,
                  width: _w / 8,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color.withOpacity(.6),
                  ),
                ),
                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: _w * .045,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget blurTheStatusBar(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: _w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text(
          'HIBMAT-MOBILE',
          style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}
