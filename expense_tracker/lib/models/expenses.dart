import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final format = DateFormat.yMd();

enum Category{
    dairy,grocerry,fruits,vegetables,other

}

var categoryIcons = {

  Category.dairy : Icons.egg_alt_rounded,
  Category.grocerry : Icons.local_grocery_store,

  Category.fruits : Icons.shopping_basket ,
  Category.vegetables : Icons.shopping_bag,
  Category.other :Icons.drag_indicator_sharp };
class Expense {
  Expense({
    required this.customerName,
    required this.amount,
    required this.date,
    required this.category
  }) : index = uuid.v4();
  final String index;
  final String customerName;
  final double amount;
  final DateTime date;
  final Category category;
 String get formatteddate{

  return format.format(date);
 }
}
