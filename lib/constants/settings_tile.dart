import 'package:allerg/Resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class SettingTile extends StatefulWidget {
  final IconData icon;
  final String title;


  SettingTile(
      { required this.icon,
        required this.title,
       });

  @override
  _SettingTileState createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Row(
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
          child: Icon(widget.icon,color: AppColors.lightText,),
        ),
        Text(
          widget.title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: AdvancedSwitch(
            activeColor: Colors.lightGreenAccent,
          ),
        )


      ],
    );
  }
}
