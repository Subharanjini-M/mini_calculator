import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String inputValue = "";
  String calculatedvalue = "";
  String operatorval = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 7;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(left: 200),
                // alignment: Alignment.bottomRight,
                child: Text(inputValue,
                    style: TextStyle(color: Colors.white, fontSize: 100))),
            Column(
              children: [
                Row(
                  children: [
                    calcButton("7", Colors.white38),
                    calcButton("8", Colors.white38),
                    calcButton("9", Colors.white38),
                    calcButton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("4", Colors.white38),
                    calcButton("5", Colors.white38),
                    calcButton("6", Colors.white38),
                    calcButton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("1", Colors.white38),
                    calcButton("2", Colors.white38),
                    calcButton("3", Colors.white38),
                    calcButton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("0", Colors.white38),
                    calcButton(".", Colors.white38),
                    calcButton("=", Colors.orange),
                    calcButton("+", Colors.orange),
                  ],
                )
              ],
            ),
            calcButton("Clear", Colors.black)
          ],
        ),
      ),
    );
  }

  Widget calcButton(String text, Color bgColor) {
    return InkWell(
      onTap: () {
        if (text == "Clear") {
          setState(() {
            inputValue = "";
            operatorval = "";
            calculatedvalue = "";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            calculatedvalue = inputValue;
            inputValue = "";
            operatorval = text;
          });
        } else if (text == "=") {
          setState(() {
            // inputValue = calculatedvalue + inputValue;
            double calc = double.parse(calculatedvalue);
            double input = double.parse(inputValue);

            if (operatorval == "+") {
              inputValue = (calc + input).toString();
            } else if (operatorval == "-") {
              inputValue = (calc - input).toString();
            } else if (operatorval == "*") {
              inputValue = (calc * input).toString();
            } else if (operatorval == "/") {
              inputValue = (calc / input).toString();
            }
          });
        } else {
          setState(() {
            inputValue = inputValue + text;
          });
        }
      },
      child: Container(
        margin: EdgeInsets.all(20),
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white60, fontSize: 30),
        ),
      ),
    );
  }
}
