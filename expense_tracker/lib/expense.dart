import 'package:expense_tracker/add_data.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/library.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> data = [Expense(customerName: 'as', amount: 3, date: DateTime.now(), category: Category.fruits)];
  void _openexpressovverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return AddData(displayData);
        });
  }

  void displayData(Expense entry) {
    setState(() {
      data.add(entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openexpressovverlay,
            icon: const Icon(Icons.add),
            color: Colors.white,
          )
        ],
        backgroundColor: const Color.fromARGB(255, 10, 57, 96),
      ),
      body: Column(
        children: [
          Expanded(child: LibraryList(data)),
          
        ],
      ),
    );
  }
}
