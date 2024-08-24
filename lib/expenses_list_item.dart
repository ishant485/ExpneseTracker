
import 'package:expense_manager/model/expense_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpensesListItem extends StatelessWidget {
  const ExpensesListItem({super.key, required this.expenseItem});
  final ExpenseModel expenseItem;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          children: [
            Text("${expenseItem.title}"),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("\$${expenseItem.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    Icon(CategoryIcons[expenseItem.category]),
                    SizedBox(width: 5,),
                    Text(expenseItem.formattedDate())
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}