import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
// import 'package:velocity_x/velocity_x.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  // variable
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';

  onButtonClick(value) {
    // print(value);
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == 'DEL') {
      input = input.substring(0, input.length - 1);
    } else if (value == "=") {
      var userInput = input;
      userInput = input.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  input,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  output,
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          )),
          Row(
            children: [
              button(
                text: "AC",
                buttonBgColor: operatorColor,
                tColor: orangeColor,
              ),
              button(
                text: "DEL",
                buttonBgColor: operatorColor,
                tColor: orangeColor,
              ),
              // button(
              //   text: "DEL",
              //   // buttonBgColor: Colors.transparent,
              //   buttonBgColor: operatorColor,
              //   tColor: orangeColor,
              // ),
              button(
                text: "/",
                buttonBgColor: operatorColor,
                tColor: orangeColor,
              ),
              // button(text: "2"),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(
                  text: "*", tColor: orangeColor, buttonBgColor: operatorColor),
              // button(text: "2"),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(
                  text: "-", tColor: orangeColor, buttonBgColor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(
                  text: "+", tColor: orangeColor, buttonBgColor: operatorColor),
              // button(text: "2"),
            ],
          ),
          Row(
            children: [
              button(
                  text: "%", tColor: orangeColor, buttonBgColor: operatorColor),
              button(text: "0"),
              button(text: "."),
              button(text: "=", buttonBgColor: orangeColor),
              // button(text: "2"),
            ],
          ),
        ],
      ),
    );
  }

  Widget button(
      {text, Color tColor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(22),
            backgroundColor: buttonBgColor, // Use buttonBgColor directly
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text ?? '',
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
