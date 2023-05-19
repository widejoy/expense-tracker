import 'package:appwrite/appwrite.dart';
import 'package:expense_tracker/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 180, 245),),
        cardTheme: const CardTheme(surfaceTintColor: Color.fromARGB(185, 75, 148, 168),color: Color.fromARGB(189, 57, 89, 179),elevation: 12,margin: EdgeInsets.symmetric(horizontal: 16),)
      ),
      home: const Expenses(),
    ),
  );
}
