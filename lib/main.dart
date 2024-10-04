import 'package:flutter/material.dart';
import 'package:practical_exam/views/Homepage.dart';
import 'package:practical_exam/views/cartpage.dart';
import 'package:practical_exam/views/detail_page.dart';

void main() {
  runApp(
    const Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      routes: {
        'home_page': (context) => const Homepage(),
        'detail_page': (context) => const DetailPage(),
        'CartPage': (context) => CartPage(),
      },
    );
  }
}
