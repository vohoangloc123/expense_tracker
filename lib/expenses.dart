import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/expenses_list/new_expense.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

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
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true, // Hiển thị modal bottom sheet từ dưới lên
        context: context,
        builder: (context) {
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  /* Hàm showModalBottomSheet hiển thị modal bottom sheet từ dưới lên.
   context: Là BuildContext của widget hiện tại, giúp xác định vị trí
   để gắn modal vào đúng phần giao diện.
   builder: Hàm builder nhận BuildContext mới, đại diện cho modal bottom sheet,
   dùng để xây dựng các widget bên trong. */
  void _addExpense(Expense expense) {
    print('Adding expense: ${expense.toString()}');
    setState(() {
      _registeredExpenses
          .add(expense); // Thêm expense vào danh sách _registeredExpenses
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          )
        ],
      ),
      body: Column(
        children: [
          const Text("The chart will be here"),
          Expanded(
              child: ExpensesList(
            expenses: _registeredExpenses,
            onRemoveExpense: _removeExpense,
          ))
        ],
      ),
    );
  }
}
