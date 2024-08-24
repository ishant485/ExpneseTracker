import 'package:expense_manager/add_new_expense.dart';
import 'package:expense_manager/chart_widgets/chart.dart';
import 'package:expense_manager/expenses_list.dart';
import 'package:flutter/material.dart';
import 'model/expense_model.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<ExpenseModel> expensesList = [];

  void addNewExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddNewExpense(appendExpense: appendNewExpense,)
    );
  }

  void appendNewExpense(ExpenseModel expense) {
    setState(() {
      expensesList.add(expense);
    });
  }

  void removeListItem(int index) {
    ExpenseModel? removedItem;
    setState(() {
      removedItem = expensesList.removeAt(index);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text('Expense deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            expensesList.insert(index, removedItem!);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget expenseContent = const Center(
      child: Text('No Expenses'),
    );
    expenseContent = (expensesList.isNotEmpty) ? ExpensesList(list: expensesList, removeListItem: removeListItem,) : expenseContent;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        centerTitle: false,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: addNewExpense,
                child: const Icon(
                    Icons.add
                ),
              )
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: expensesList),
          Expanded(
            child: expenseContent,
          ),
        ],
      ),
    );
  }
}