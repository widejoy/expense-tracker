import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/item.dart';
import 'package:flutter/material.dart';

class LibraryList extends StatelessWidget {
  const LibraryList(this.expenses, {super.key});

  final List<Expense> expenses;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: const Color.fromARGB(255, 254, 4, 4),
        ),
        key: ValueKey(expenses[index]),
        child: item(expenses[index]),
        onDismissed: (direction) => expenses.remove(expenses[index]),
        confirmDismiss: (DismissDirection direction) async {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Confirm"),
                content:
                    const Text("Are you sure you wish to delete this item?"),
                actions: <Widget>[
                  OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text("DELETE")),
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("CANCEL"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
