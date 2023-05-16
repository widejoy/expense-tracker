import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category{
    dairy,grocerry,fruits,vegetables

}
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

}
