import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  String _enteredTitle = "";
  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const TextField(
            maxLength: 50,
            decoration: InputDecoration(labelText: "Title"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Amount"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Date"),
          ),
          ElevatedButton(
            onPressed: () {
              print(_enteredTitle);
            },
            child: const Text("Add Expense"),
          )
        ],
      ),
    );
  }
}
