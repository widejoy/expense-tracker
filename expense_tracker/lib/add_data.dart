import 'package:flutter/material.dart';
import 'models/expenses.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() {
    return _AddData();
  }
}

class _AddData extends State<AddData> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? _selecteddate;
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
      _selecteddate = pickedDate;
    });
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
                    const SizedBox( width: 100,),
                    DropdownButton(
                      value: _selectedcategory,
                        items: Category.values.map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name.toUpperCase()),
                          ),
                        ).toList(),
                        
                        onChanged: (value) {
                          if(value == null)
                          {return;}
                          else{
                            setState(() {
                              _selectedcategory = value;
                            });
                          }
                        }),
                    const SizedBox( width: 100,),
                    Text(
                      _selecteddate == null
                          ? 'select a date'
                          : format.format(_selecteddate!),
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
                onPressed: () {},
                child: const Text('Add customer'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
