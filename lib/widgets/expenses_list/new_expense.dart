import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  String _enteredTitle = "";

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.Food;
  void _saveTitleInput(String inputValue) {
    setState(() {
      _enteredTitle = inputValue;
    });
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 1);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
    print(pickedDate);
  }
  //Sử dụng async và await giúp làm cho việc viết và duy trì mã dễ dàng hơn, đặc biệt khi làm việc với các tác vụ bất đồng bộ.

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null ||
        _selectedCategory == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Please enter valid input"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Okay"),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory!),
    );
    Navigator.pop(context); //đóng modal bottom sheet
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '\$ ', labelText: "Amount"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Aligns the children to the right
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Aligns the children to the center
                  children: [
                    Text(_selectedDate == null
                        ? 'No Date Chosen'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory, //giá trị mặc định
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category, //giá trị của mục
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) {
                        return;
                      }
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  _submitExpenseData();
                },
                child: const Text("Add Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
