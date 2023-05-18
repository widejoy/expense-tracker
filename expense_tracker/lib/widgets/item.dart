import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
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
            Row(
              children: [
                Text(expense.customerName),
                IconButton(
                  alignment: Alignment.topRight,
                  color:const  Color.fromARGB(255, 236, 37, 6),
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
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
        ),
      ),
    );
  }
}
