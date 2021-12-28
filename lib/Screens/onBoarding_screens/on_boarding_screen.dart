import 'package:allerg/Resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import '../login_screen.dart';
import '../sign_up_screen.dart';
import 'onboard_model_pages.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  bool _accept = true;

  Widget _onBoardingBtns(String text, Color color,Color textColor) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: color,
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5],
              colors: [
                AppColors.lightGradient,
                AppColors.lightText,
              ])
      ),
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 25),
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 17.0,
              )),
        ),
      ),
    );
  }
  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(minHeight: 15),
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Stack(
          children: [
            PageIndicatorContainer(
              padding: EdgeInsets.only(top: 50,bottom: 260),
              indicatorColor: AppColors.primary,
              indicatorSelectorColor: AppColors.primary,
              align: IndicatorAlign.bottom,
              length: 4,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: onChangedFunction,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index){
                   if (index == 0){
                      return const OnBoardModel(
                          title: "Choose Ingredients",
                          subtitle: "Lorem ipsum dolor sit amet, consecttur adipiscing elit",
                          image: "assets/images/boardone.png"
                      );
                    }else if(index == 1){
                      return const OnBoardModel(
                          title: "Track your Allergy",
                          subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          image: "assets/images/boardtwo.png"
                      );
                    }else if(index == 2){
                      return const OnBoardModel(
                          title: "Get in touch",
                          subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          image: "assets/images/boardthree.png"
                      );
                    }
                    return Container();
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Positioned(
              bottom: 50,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
                        },
                        child: _onBoardingBtns(
                            "Continue",
                            AppColors.buttons,Colors.white)),
                  ),
                  const Text(
                      'Skip',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}