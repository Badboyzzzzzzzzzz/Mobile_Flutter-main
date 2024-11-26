import 'package:flutter/material.dart';
import 'package:fudamental_flutter/W8-S1/models/expense.dart';
import 'package:fudamental_flutter/W8-S1/screens/expense-list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      ExpenseType.food,
      title: 'Flutter Course',
      price: 19.99,
      date: DateTime.now(),
    )
  ];

  void onAdd() {
    print("nood");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
        actions: [IconButton(onPressed: onAdd, icon:Icon(Icons.add))],
      ),
      body: ExpensesList(expenses: _registeredExpenses),
    );
  }
}
