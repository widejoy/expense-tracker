import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';

class item extends StatelessWidget {
  const item(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Card(
          child: Column(
        children: [
          Text(expense.customerName),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('₹${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  Text(
                    expense.category.toString(),
                  ),
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(
                    width: 25,
                  ),
                  const Icon(Icons.access_alarm),
                  Text(
                    expense.formatteddate,
                  ),
                  
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
