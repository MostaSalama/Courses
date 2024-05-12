import 'package:flutter/material.dart';
import 'package:learning/screens/continue_watching_screen.dart';
import 'package:learning/screens/side_bar_screen.dart';

import '../components/home_screen_navbar.dart';
import '../components/lists/explorecourse_list.dart';
import '../components/lists/recent_course_list.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  late Animation<Offset> sideBarAnimation;
  late Animation<double> fadeAnimation;
  late AnimationController sideBarAnimationController;

  var sideBarHidden = true ;

  @override
  void initState() {
    super.initState();
    sideBarAnimationController = AnimationController(vsync:this,
      duration: Duration(milliseconds: 250),

    );
    sideBarAnimation = Tween<Offset>(
        begin: Offset(-1,0),
      end: Offset(0,0),
    ).animate(
      CurvedAnimation(parent: sideBarAnimationController, curve: Curves.easeInOut)
    );
    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: sideBarAnimationController, curve: Curves.easeInOut)
    );
  }

  @override
  void dispose() {
    super.dispose();
    sideBarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: kBackgroundColor,
          child: Stack(
            children: [
              SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          HomeScreenNavbar(triggerAnimation:() {
                
                            setState(() {
                              sideBarHidden = !sideBarHidden;
                            });
                            sideBarAnimationController.forward();
                
                          }
                          ),
                          Text('Recents',style: kLargeTitleStyle,),
                          SizedBox(height: 5,),
                          Text('23 courser, more coming!',style: kSubtitleStyle,),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    RecentCourseList(),
                    Padding(padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 25,
                        bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Explore',style: kTitle1Style,),
                        ],
                      ),
                    ),
                    ExploreCourseList(),
                  ],
                ),
              ),
            ),
              ContinueWatchingScreen(),
              IgnorePointer(
                ignoring: sideBarHidden,
                child: Stack(
                  children:[
                    FadeTransition(
                      opacity: fadeAnimation,
                      child: GestureDetector(
                        child: Container(
                          color: Color.fromRGBO(36, 38, 41, 0.4),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                
                        ),
                        onTap: () {
                          sideBarAnimationController.reverse();
                          setState(() {
                            sideBarHidden = !sideBarHidden;
                          });
                        },
                      ),
                    ),
                    SlideTransition(
                    position: sideBarAnimation,
                    child: SafeArea(
                        bottom: false,
                        child: SideBarScreen(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}