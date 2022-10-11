import 'package:flutter/material.dart';
import 'package:payment_app/pages/my_home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: const   MyHomeView(),
    );
  }
}



 
