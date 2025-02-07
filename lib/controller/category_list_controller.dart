import 'package:expense_manager_app/model/category.dart';
import 'package:flutter/material.dart';

class CategoryListProvider extends ChangeNotifier {
  List<Category> categoryList = [
    Category(
        category: "Food",
        imageUrl:
            "https://drive.google.com/uc?export=view&id=1ZSMnW-oVnov57RcpEolJsEj-i9H_hPxx"),
    Category(
        category: "Fuel",
        imageUrl:
            "https://drive.google.com/uc?export=view&id=1zoh2TK0xWue5Ogku7uzm2jAW9sPSp_q5"),
    Category(
        category: "Medicine",
        imageUrl:
            "https://drive.google.com/uc?export=view&id=1XsUPGKbgoa35tcuX0b5F7RMw3WfjtkCt"),
    Category(
        category: "Shopping",
        imageUrl:
            "https://drive.google.com/uc?export=view&id=19L7gYxLC5WkvBJhenYrGlyXNMaJ04Q36"),
  ];

  void addNewCategory({
    required String imageUrl,
    required String category,
  }) {
    categoryList.add(Category(category: category, imageUrl: imageUrl));
    notifyListeners();
  }

  void removeCategory({required int index}) {
    categoryList.removeAt(index);
    notifyListeners();
  }
}
