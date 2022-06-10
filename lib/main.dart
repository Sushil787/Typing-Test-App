
import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';

void main() => runApp(MyBoard());

class MyBoard extends StatelessWidget {
  const MyBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            elevation: 2,
            centerTitle: true,
            title: Text(
              "This is typing board",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            backgroundColor: Colors.amber,
          ),
          body: HomePage()),
    );
  }
}
