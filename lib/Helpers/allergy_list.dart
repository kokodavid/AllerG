import 'package:allerg/models/allergy_list_item.dart';

class AllergyList{
  static List<AllergyItem> getMockedAllergies() {
    return [
      AllergyItem(
        name: "Peanut",
        icon: "assets/images/peanut.png"
      ),
      AllergyItem(
        name: "Soy",
        icon: "assets/images/soy.png"
      ),
      AllergyItem(
        name: "Nuts",
        icon: "assets/images/nuts.png"
      ),
      AllergyItem(
        name: "Legumes",
        icon: "assets/images/legumes.png"
      ),
      AllergyItem(
        name: "Fruit",
        icon: "assets/images/fruit.png"
      ),
      AllergyItem(
        name: "Fish",
        icon: "assets/images/fish.png"
      ),
      AllergyItem(
        name: "Wheat",
        icon: "assets/images/wheat.png"
      ),
      AllergyItem(
        name: "Milk",
        icon: "assets/images/milk.png"
      ),
      AllergyItem(
        name: "Eggs",
        icon: "assets/images/egg.png"
      ),
      AllergyItem(
        name: "Sesame",
        icon: "assets/images/seasame.png"
      ),
    ];
  }
}