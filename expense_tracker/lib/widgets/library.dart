import 'package:expense_tracker/models/data.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/item.dart';
import 'package:flutter/widgets.dart';

class LibraryList extends StatelessWidget{
  const LibraryList(this.expenses,{super.key});
 
  final List<Expense> expenses;
  @override
  Widget build(context){
          
      return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx,index) => item(expenses[index]),
      );
    

  }
}