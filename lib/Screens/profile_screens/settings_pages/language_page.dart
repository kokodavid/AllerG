import 'package:allerg/Helpers/language_list.dart';
import 'package:allerg/Resources/colors.dart';
import 'package:allerg/models/language_item.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  List<LanguageItem> language = LanguageList.getLanguage();

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
                      children: const [
                        Icon(Icons.arrow_back_ios),
                        Center(
                            child: Text(
                              "Language",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            )),
                        Text(
                          "Save",
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 12,top: 10),
                  alignment: Alignment.topLeft,
                  child: const Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                              text: 'Select Language',
                              style: TextStyle(
                                fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ]
                      )
                  )
              ),
              ListView.builder(
                  itemCount: language.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int index){
                    return Container(

                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        child: Container(
                          height: 65,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: AppColors.lightText),
                              color: Colors.white
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right:15),
                                child: Image.asset(
                                  language[index].icon,
                                  height: 25,
                                  width: 35,
                                ),
                              ),
                              Text(
                                language[index].name,
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: AppColors.textColor
                                ),
                              )
                            ],
                          ),
                        )
                    );

                  }
              )

            ],
          ),
        ),
      ),
    );
  }
}
