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
    final _titleController = TextEditingController();
    final _amountController = TextEditingController();
    final _dateController = TextEditingController();
    @override
    void dispose() {
      _titleController.dispose();
      _amountController.dispose();
      _dateController.dispose();
      super.dispose();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Amount"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Date"),
          ),
          ElevatedButton(
            onPressed: () {
              print(_titleController.text);
            },
            child: const Text("Add Expense"),
          )
        ],
      ),
    );
  }
}
