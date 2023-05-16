import 'package:expense_tracker/widgets/library.dart';
import 'package:expense_tracker/models/data.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return
    
       Column(
        children:  [  
          const Text('chart'),
          Expanded(child: LibraryList(data)),
         
        ],
      );
    
  }
}
