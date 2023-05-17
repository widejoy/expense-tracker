import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() {
    return _AddData();
  }
}

class _AddData extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(label:Text('customer name')),
          )
        ],
      ),
    );
  }
}
