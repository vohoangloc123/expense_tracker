import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  Food,
  Transportation,
  Housing,
  Utilities,
  Clothing,
  Health,
  Insurance,
  Personal,
  Education,
  Entertainment,
  Miscellaneous,
}

class Expense {
  Expense(
    this.category, {
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4(); // Initialize id here

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;
}
