import 'package:flutter/material.dart';

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
          TextField(
            controller: _amountcontroller,
            maxLength: 10,
            decoration: const InputDecoration(label: Text('amount'),),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add customer'),
              ),
              ElevatedButton(onPressed: (){}, child: const Text('cancel',style: TextStyle(color: Color.fromARGB(211, 201, 11, 11)),),)
            ],
          )
        ],
      ),
    );
  }
}
