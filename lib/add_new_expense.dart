import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/expense_model.dart';

class AddNewExpense extends StatefulWidget {
  final void Function(ExpenseModel) appendExpense;

  const AddNewExpense({
    super.key,
    required this.appendExpense,
  });

  @override
  State<StatefulWidget> createState() {
    return _AddNewExpenseState();
  }
}

class _AddNewExpenseState extends State<AddNewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  Category dropDownValue = Category.leisure;

  void _expenseDatePicker() async {
    DateTime now = DateTime.now();
    DateTime startDate = DateTime(now.year - 1, now.month, now.day);
    selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: startDate,
      lastDate: now,
    );
    if (selectedDate != null) {
      setState(() {});
    }
  }
  void _saveExpense() {
    var title = _titleController.text.trim();
    var isEmptyTitle = title.isEmpty;
    var enteredAmount = _amountController.text.trim().isEmpty ? null : double.parse(_amountController.text);
    var invalidAmount = enteredAmount == null || enteredAmount < 0;
    var invalidDate = selectedDate == null;
    if (isEmptyTitle || invalidAmount || invalidDate) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Invalid Details'),
              content: const Text('Please enter valid data'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('Ok'),
                )
              ],
            );
          });
    } else {
      widget.appendExpense(ExpenseModel(title: title, amount: enteredAmount, date: selectedDate!, category: dropDownValue));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLength: 50,
              controller: _titleController,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefix: Text("\$"), label: Text("Amount")),
                  ),
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text(selectedDate == null
                      ? "No Date Selected"
                      : dateFormat.format(selectedDate!)),
                  IconButton(
                    onPressed: _expenseDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                DropdownButton(
                  value: dropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toString().toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      dropDownValue = value;
                    });
                  },
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                OutlinedButton(
                  onPressed: _saveExpense,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue.shade700; // Darker blue when pressed
                      } else if (states.contains(MaterialState.disabled)) {
                        return Colors
                            .blue.shade100; // Lighter blue when disabled
                      }
                      return Colors.blue; // Default blue color
                    }),
                  ),
                  child: const Text(
                    "Save Expense",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
