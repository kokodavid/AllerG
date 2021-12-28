import 'package:flutter/material.dart';

class OnBoardModel extends StatelessWidget {
  final String? title, subtitle,image;

  const OnBoardModel({Key? key,this.title,this.image,this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Image.asset(image!,fit: BoxFit.contain,)
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 8),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0,vertical: 8),
            child: Text(
                subtitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
              ),

            ),
          )

        ],
      ),
    );
  }
}
