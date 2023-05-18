import 'package:flutter/material.dart';
import 'models/expenses.dart';

class AddData extends StatefulWidget {
  const AddData(this.onAddexpense, {super.key});
  final void Function(Expense expense) onAddexpense;
  @override
  State<AddData> createState() {
    return _AddData();
  }
}

class _AddData extends State<AddData> {
  List<Map<String, Object>> enteredData = [];
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime _selecteddate = DateTime.now();
  Category _selectedcategory = Category.fruits;
  void _datepicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime.now(),
    );
    setState(() {
      _selecteddate = pickedDate!;
    });
  }

  void _sumbit() {
    final enterednumber = double.tryParse(_amountcontroller.text);
    final amountvalid = enterednumber == null && enterednumber != 0;

    if (_titlecontroller.text.trim().isEmpty || amountvalid != false) {
      showDialog(
        context: context,
        builder: (cxt) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('please enter a valid input'),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(cxt);
                },
                child: const Text('okay'),
              ),
            ],
          );
        },
      );
      return;
    } else {
      widget.onAddexpense(Expense(
          customerName: _titlecontroller.text,
          amount: enterednumber!,
          date: _selecteddate,
          category: _selectedcategory));
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titlecontroller,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('customer name'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountcontroller,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                      label: Text('amount'), prefixText: '₹'),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    DropdownButton(
                        value: _selectedcategory,
                        items: Category.values
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          } else {
                            setState(() {
                              _selectedcategory = value;
                            });
                          }
                        }),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(
                      format.format(_selecteddate),
                    ),
                    IconButton(
                      onPressed: _datepicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'cancel',
                  style: TextStyle(color: Color.fromARGB(211, 201, 11, 11)),
                ),
              ),
              ElevatedButton(
                onPressed: _sumbit,
                child: const Text('Add customer'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
