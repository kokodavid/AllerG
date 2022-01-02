import 'package:allerg/models/language_item.dart';

class LanguageList{
  static List<LanguageItem> getLanguage(){
    return [
      LanguageItem(
          name: "English",
          icon: "assets/images/uk.png"
      ),
      LanguageItem(
          name: "Hebrew",
          icon: "assets/images/israel.png"
      ),
      LanguageItem(
          name: "French",
          icon: "assets/images/france.png"
      ),
      LanguageItem(
          name: "German",
          icon: "assets/images/germany.png"
      ),
    ];
  }
}