import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/item.dart';
import 'package:flutter/widgets.dart';

class LibraryList extends StatelessWidget {
  const LibraryList(this.expenses, {super.key});

  final List<Expense> expenses;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        child: item(expenses[index]),
        onDismissed: (direction) => expenses.remove(expenses[index]),
      ),
    );
  }
}
