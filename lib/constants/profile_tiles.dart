import 'package:allerg/Resources/colors.dart';
import 'package:flutter/material.dart';

class ProfileTiles extends StatefulWidget {
  final IconData icon;
  final String title;


  ProfileTiles(
      { required this.icon,
        required this.title,
       });

  @override
  _ProfileTilesState createState() => _ProfileTilesState();
}

class _ProfileTilesState extends State<ProfileTiles> {
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
        Container(
          margin: EdgeInsets.only(top: 15),
          height: size.height*.065,
          width: size.height*.065,
          decoration:  BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0,2),
                    color: AppColors.dimColor,
                    spreadRadius: .5,
                    blurRadius: 4
                )],
              color: AppColors.profileTile,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Icon(Icons.arrow_forward_ios,color: AppColors.lightText,),
        ),

      ],
    );
  }
}
