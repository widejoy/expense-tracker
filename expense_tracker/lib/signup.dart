import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key, required this.client, required this.account, required this.storage, required this.database});

  final Client client;
  final Account account;
  final Storage storage;
  final Databases database;

  @override
  State<StatefulWidget> createState() {
    return _Signup();
  }
}
var _username = TextEditingController();
var _password = TextEditingController();


class _Signup extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        TextField(
          controller: _username,
          maxLength: 30,
          decoration:const  InputDecoration(
            label: Text('username'),
          ),
        ),
        const SizedBox(height: 30,),
        TextField(
          controller: _password,
           decoration: const InputDecoration(
            label: Text('password'),
          ),),
        const SizedBox(height: 30,),
        ElevatedButton(onPressed: () {
          var username = _username.text;
          var password = _password.text;
                  }, child: const Text('submit'),)


      ],
    );
  }
}
