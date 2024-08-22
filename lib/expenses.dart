import 'package:expense_tracker/models/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

import 'expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.Education),
    Expense(
        title: "Cinema",
        amount: 15.69,
        date: DateTime.now(),
        category: Category.Entertainment),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add a new expense
              setState(() {
                _registeredExpenses.add(Expense(
                    title: "New Expense",
                    amount: 0.0,
                    date: DateTime.now(),
                    category: Category.Miscellaneous));
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          const Text("The chart will be here"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
