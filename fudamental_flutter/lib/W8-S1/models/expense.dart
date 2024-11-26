import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

enum ExpenseType { food, travel, lesure, work }

const Uuid uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double price;
  final DateTime date;
  final ExpenseType type;

  Expense(this.type,
      {required this.title, required this.price, required this.date})
      : id = uuid.v4();
}

