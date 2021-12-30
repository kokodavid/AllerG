import 'package:allerg/Resources/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            height: size.height*.28,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    stops: [0.1, 0.5],
                    tileMode: TileMode.decal,
                    colors: [
                      AppColors.lightGrad,
                      AppColors.lightBlueGrad,
                    ])
            ),
            child: Stack(
              children:  [
                Positioned(
                  top: kToolbarHeight,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      const Center(
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          )),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                            height: size.height*.15,
                            width: size.width*.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Image.asset(
                                'assets/images/boardone.png',
                            ),
                          ),
                          const Text(
                              "John Doe",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
