import 'package:expense_manager_app/model/transaction.dart';
import 'package:flutter/material.dart';

class TransacationListController extends ChangeNotifier {
  List<Transaction> transactionList = [];

  void addTransaction({
    required String category,
    required String imageUrl,
    required String date,
    required String description,
    required double amount,
  }) {
    transactionList.add(Transaction(
      amount: amount,
      category: category,
      description: description,
      date: date,
      imageUrl: imageUrl,
    ));
    notifyListeners();
  }
}
