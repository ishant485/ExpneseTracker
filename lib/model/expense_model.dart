import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, leisure, travel, work }

const CategoryIcons = {
  Category.food: Icons.fastfood,
  Category.leisure: Icons.emoji_people,
  Category.travel: Icons.mode_of_travel,
  Category.work: Icons.work
};

class ExpenseModel {
  final String expenseId;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : expenseId = uuid.v4();

  String formattedDate() {
    var utcDate = date.toUtc();
    var istDate = utcDate.add(const Duration(hours: 5, minutes: 30));
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(istDate);
  }
}
