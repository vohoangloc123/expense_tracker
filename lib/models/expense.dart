import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  Food,
  Transportation,
  Housing,
  Utilities,
  Clothing,
  Health,
  Education,
  Entertainment,
}

final formatter = DateFormat.yMd().format(DateTime.now());
const categoryIcons = {
  Category.Food: Icons.fastfood,
  Category.Transportation: Icons.directions_bus,
  Category.Housing: Icons.home,
  Category.Utilities: Icons.flash_on,
  Category.Clothing: Icons.shopping_bag,
  Category.Health: Icons.local_hospital,
  Category.Education: Icons.school,
  Category.Entertainment: Icons.movie,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    // Add this parameter
  }) : id = uuid.v4(); // Initialize id here

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate {
    return DateFormat.yMd().format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
