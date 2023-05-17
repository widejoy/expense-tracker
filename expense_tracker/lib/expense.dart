import 'package:expense_tracker/add_data.dart';
import 'package:expense_tracker/widgets/library.dart';
import 'package:expense_tracker/models/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  void _openexpressovverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const AddData();
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
                const Text('chart'),
                Expanded(child: LibraryList(data)),
              ],
            ));
  }
}
