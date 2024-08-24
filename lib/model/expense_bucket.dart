import 'package:expense_manager/model/expense_model.dart';

class ExpenseBucket {
  Category category;
  List<ExpenseModel> expenses;

  ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(this.category, List<ExpenseModel> list)
      : expenses =
            list.where((element) => category == element.category).toList();

  double get totalExpense {
    double totalExpense = 0;
    for ( final expense in expenses ) {
      totalExpense += expense.amount;
    }
    return totalExpense;
  }
}