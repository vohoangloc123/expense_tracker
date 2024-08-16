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
  leisure,
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // Initialize id here

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
