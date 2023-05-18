import 'package:appwrite/appwrite.dart';
import 'package:expense_tracker/expense.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  Account account = Account(client);
  Storage storage = Storage(client);
  Databases databases = Databases(client);

  client
          .setEndpoint('https://cloud.appwrite.io/v1')
          .setProject('646621dcee733ff99e98') // Your project ID
          .setSelfSigned() // Do not use this in production
      ;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}
