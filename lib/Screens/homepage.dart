import 'package:allerg/Resources/colors.dart';
import 'package:allerg/Screens/epi_pen_page.dart';
import 'package:allerg/Screens/profile_page.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'games_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  final _bottomNavIndex = 0; //default index of a first screen
  int _currentIndex = 0;

  late PageController _pageController;
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;


  final iconList = <IconData>[
    Icons.home_rounded,
    Icons.person_rounded,
    Icons.games_rounded,
    Icons.room_rounded,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children:const <Widget> [
            EpiPenPage(),
            ProfilePage(),
            GamesPage(),
            EpiPenPage(),
          ],
        ),
      ),


      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          elevation: 8,
          backgroundColor: AppColors.floatButton,
          child: Column(
            children: const [
               Icon(
                Icons.warning,
                color: Colors.white,
              ),
              Text("SOS")
            ],
          ),
          onPressed: () {
            _animationController.reset();
            _animationController.forward();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
// padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          notchMargin: 5,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          }
          //other params
        ),
      ),
    );
  }
}
