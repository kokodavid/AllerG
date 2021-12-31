import 'package:allerg/Resources/colors.dart';
import 'package:allerg/constants/profile_tiles.dart';
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
        mainAxisSize: MainAxisSize.max,
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
                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 29),
                            height: size.height*.11,
                            width: size.width*.25,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(image: AssetImage('assets/images/boardone.png',),fit: BoxFit.cover)
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
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 18),
            child: Column(
              children: [
                ProfileTiles(icon: Icons.person, title: "Personal Data"),
                SizedBox(height: 12,),
                ProfileTiles(icon: Icons.info, title: "Allergy Information"),
                SizedBox(height: 12,),
                ProfileTiles(icon: Icons.settings, title: "Settings")
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Divider(
              color: AppColors.profileTile,
              thickness: 2,
              height: 10,
              endIndent: 15,
              indent: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15,right: 20),
                  height: size.height*.065,
                  width: size.height*.065,
                  decoration:  BoxDecoration(
                      boxShadow:  const [
                        BoxShadow(
                            offset: Offset(0,2),
                            color: AppColors.dimColor,
                            spreadRadius: .5,
                            blurRadius: 4
                        )],
                      color: AppColors.profileTile,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Icon(Icons.logout,color: AppColors.lightText,),
                ),
                const Text(
                  "Log Out",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(),

              ],
            ),
          )



        ],
      ),
    );
  }
}
