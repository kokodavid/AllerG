import 'package:allerg/Resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import '../auth_pages/login_screen.dart';
import '../auth_pages/sign_up_screen.dart';
import 'onboard_model_pages.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with SingleTickerProviderStateMixin {
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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
      currentIndex += index;
      _pageController.animateToPage(index, duration: const Duration(seconds : 1), curve: _kCurve,);

    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(minHeight: 15),
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Stack(
          children: [
            PageIndicatorContainer(
              padding: EdgeInsets.only(top: 50,bottom: size.height*.25),
              indicatorColor: AppColors.primary,
              indicatorSelectorColor: AppColors.primary,

              align: IndicatorAlign.bottom,
              length: 3,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: onChangedFunction,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 3,
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
                    }else{
                      return const OnBoardModel(
                          title: "Get in touch",
                          subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          image: "assets/images/boardthree.png"
                      );
                    }
                  }),
            ),
            Positioned(
              bottom: size.height*.04,
              right: 0,
              left: 0,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: InkWell(
                        onTap: (){

                          onChangedFunction(currentIndex + 1);
                          setState(() {});
                        },
                        child: _onBoardingBtns(
                            "Continue",
                            AppColors.buttons,Colors.white)),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
                    },
                    child: const Text(
                        'Skip',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold
                      ),
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