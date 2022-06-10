import 'package:flutter/material.dart';
import 'dart:async';

import 'package:portfolio/pages/typing%20speed%20algo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int timeLeft = 30;
  bool readOnlyValue = false;
  String? typedText;
  String speed = " ";
  FocusNode focusTextField = FocusNode();
  TextEditingController texte = TextEditingController();

  void decreament() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft == 0) {
        setState(() {
          speed = checkTypingSpeed(typedText);
        });
        timer.cancel();
        setState(() {
          readOnlyValue = true;
        });
      } else {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    focusTextField.addListener(() {
      if (focusTextField.hasFocus) {
        decreament();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: timeLeft != 0
                    ? Row(
                        children: [
                          Text(
                            "Time Left ${timeLeft}S",
                            style: TextStyle(
                                fontFamily: 'Oswald',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            "your Typing speed is $speed WPM",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Oswald'),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                timeLeft = 30;

                                readOnlyValue = false;
                                typedText = "";
                                speed = " ";
                                texte.text = "";
                              });
                            },
                            child: Icon(Icons.restart_alt_rounded),
                          ),
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              elevation: 3,
              child: Container(
                height: 200,
                width: 600,
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "I went to the park and saw a tree, it was a big tree and it was very green. I could see a red apple on a high branch so I reached up and picked it off. It was weird how I picked it off, as I am very short. I suppose I just jumped really high.   .Days are not of equal value in one’s life. Some bring happiness while others bring sadness. Sadness and happiness both are equally important to man’s life, since they are the two sides of a coin. As we cannot forget the happiest day, we are unable to forget the saddest day of our life too.",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              elevation: 2,
              child: Container(
                  height: 200,
                  width: 600,
                  child: TextField(
                    controller: texte,
                    readOnly: readOnlyValue,
                    focusNode: focusTextField,
                    maxLines: null,
                    expands: true,
                    onChanged: (value) {
                      setState(() {
                        typedText = value;
                      });
                    },
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Type the above text',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10)),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
