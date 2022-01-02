import 'package:allerg/Resources/colors.dart';
import 'package:allerg/Screens/profile_screens/settings_pages/language_page.dart';
import 'package:allerg/Screens/profile_screens/settings_pages/location_page.dart';
import 'package:allerg/Screens/profile_screens/settings_pages/login_information.dart';
import 'package:allerg/Screens/profile_screens/settings_pages/notifications_page.dart';
import 'package:allerg/constants/profile_tiles.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(
            top: kToolbarHeight
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: Positioned(
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Icon(Icons.arrow_back_ios),
                        const Center(
                            child: Text(
                              "Settings",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            )),
                        Container()

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 18),
                child: Column(
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginInformation()));
                      },
                      child: ProfileTiles
                        (icon: Icons.email_rounded, title: "Login Information"),
                    ),
                    SizedBox(height: 12,),
                    InkWell(
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LanguagePage()));
                      },
                      child: ProfileTiles
                        (icon: Icons.translate, title: "Language"),
                    ),
                    SizedBox(height: 12,),
                    InkWell(
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationPage()));
                      },
                      child: ProfileTiles
                        (icon: Icons.notifications, title: "Notifications"),
                    ),
                    SizedBox(height: 12,),
                    InkWell(
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LocationSetting()));
                      },
                      child: ProfileTiles
                        (icon: Icons.share_location, title: "Location"),
                    ),
                    SizedBox(height: 12,),
                    ProfileTiles
                      (icon: Icons.lightbulb, title: "Help"),

                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );  }
}
