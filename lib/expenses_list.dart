import 'package:expense_manager/expenses_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'model/expense_model.dart';

class ExpensesList extends StatelessWidget {
  final List<ExpenseModel> list;
  void Function(int index) removeListItem;
  ExpensesList({super.key, required this.list, required this.removeListItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, index) =>
          Dismissible(
            key: ValueKey(list[index]),
            child: ExpensesListItem(expenseItem: list[index]),
            onDismissed: (direction) {
              removeListItem(index);
            },
      ),
    );
  }

}