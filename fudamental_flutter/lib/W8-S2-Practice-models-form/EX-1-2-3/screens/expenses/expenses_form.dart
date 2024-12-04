import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onSubmit});
  final Function(Expense) onSubmit;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  ExpenseCategory dropDown = ExpenseCategory.leisure;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _datepickerController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _datepickerController.dispose();
    super.dispose();
  }

  void _datePicker() async {
    DateTime? pickeddate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pickeddate != null) {
      setState(() {
        _datepickerController.text = pickeddate.toString().split("/")[0];
      });
    }
  }

  void _createNewExpense() {
    final title = _titleController.text;
    final datepicker = _datepickerController.text.trim();
    final amountText = _amountController.text;
    final amount = double.tryParse(amountText) ?? 0;

    if (title.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Title cannot be empty!'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, 'Ok'),
                child: const Text('Ok'))
          ],
        ),
      );
    } else if (amount.isNegative) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('The Amount shall be a positive number'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, 'Ok'),
                child: const Text('Ok'))
          ],
        ),
      );
    } else if (amountText.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Amount cannot be empty!'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, 'Ok'),
                child: const Text('Ok'))
          ],
        ),
      );
    } else {
      final expense = Expense(
          title: title,
          amount: amount,
          date: DateTime.parse(datepicker),
          category: dropDown);
      widget.onSubmit(expense);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title!'),
            ),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              label: Text('Amount'),
              prefixText: '\$',
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          TextField(
            controller: _datepickerController,
            decoration: const InputDecoration(
                labelText: 'Date',
                filled: true,
                prefixIcon: Icon(Icons.calendar_today),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
            readOnly: true,
            onTap: () {
              _datePicker();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<ExpenseCategory>(
                value: dropDown,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (ExpenseCategory? value) {
                  setState(() {
                    dropDown = value!;
                  });
                },
                items: ExpenseCategory.values.map((ExpenseCategory category) {
                  return DropdownMenuItem<ExpenseCategory>(
                    value: category,
                    child: Row(
                      children: [
                        Icon(category.icon),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(category.name)
                      ],
                    ),
                  );
                }).toList(),
              ),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.pop(context),
                      },
                  child: const Text('Cancel')),
              ElevatedButton(
                onPressed: _createNewExpense,
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
