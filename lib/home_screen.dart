import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = "";
  var answer = "";

  void equal() {
    String finalAnswer = userInput;
    finalAnswer = userInput.replaceAll("x", "*");
    Parser parser = Parser();
    Expression expression = parser.parse(finalAnswer);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        userInput.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        answer.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          onPress: () {
                            setState(() {
                              userInput = "";
                              answer = "";
                            });
                          },
                          text: "AC",
                          color: Colors.grey,
                        ),
                        MyButton(
                          onPress: () {
                            setState(() {
                              userInput += "+/-";
                            });
                          },
                          text: "+/-",
                          color: Colors.grey,
                        ),
                        MyButton(
                          text: "%",
                          color: Colors.grey,
                          onPress: () {
                            setState(() {
                              userInput += "%";
                            });
                          },
                        ),
                        MyButton(
                          text: "/",
                          color: Colors.deepOrange,
                          onPress: () {
                            setState(() {
                              userInput += "/";
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          onPress: () {
                            setState(() {
                              userInput += "7";
                            });
                          },
                          text: "7",
                          color: Colors.grey,
                        ),
                        MyButton(
                          onPress: () {
                            setState(() {
                              userInput += "8";
                            });
                          },
                          text: "8",
                          color: Colors.grey,
                        ),
                        MyButton(
                          text: "0",
                          color: Colors.grey,
                          onPress: () {
                            setState(() {
                              userInput += "0";
                            });
                          },
                        ),
                        MyButton(
                          text: "x",
                          color: Colors.deepOrange,
                          onPress: () {
                            setState(() {
                              userInput += "x";
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          onPress: () {
                            setState(() {
                              userInput += "4";
                            });
                          },
                          text: "4",
                          color: Colors.grey,
                        ),
                        MyButton(
                          onPress: () {
                            setState(() {
                              userInput += "5";
                            });
                          },
                          text: "5",
                          color: Colors.grey,
                        ),
                        MyButton(
                          text: "6",
                          color: Colors.grey,
                          onPress: () {
                            setState(() {
                              userInput += "6";
                            });
                          },
                        ),
                        MyButton(
                          text: "-",
                          color: Colors.deepOrange,
                          onPress: () {
                            setState(() {
                              userInput += "-";
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          onPress: () {
                            setState(() {
                              userInput += "1";
                            });
                          },
                          text: "1",
                          color: Colors.grey,
                        ),
                        MyButton(
                          onPress: () {
                            setState(() {
                              userInput += "2";
                            });
                          },
                          text: "2",
                          color: Colors.grey,
                        ),
                        MyButton(
                          text: "3",
                          color: Colors.grey,
                          onPress: () {
                            setState(() {
                              userInput += "3";
                            });
                          },
                        ),
                        MyButton(
                          text: "+",
                          color: Colors.deepOrange,
                          onPress: () {
                            setState(() {
                              userInput += "+";
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          onPress: () {
                            setState(() {
                              userInput += "0";
                            });
                          },
                          text: "0",
                          color: Colors.grey,
                        ),
                        MyButton(
                          onPress: () {
                            setState(() {
                              userInput += ".";
                            });
                          },
                          text: ".",
                          color: Colors.grey,
                        ),
                        MyButton(
                          text: "DEL",
                          color: Colors.grey,
                          onPress: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                        ),
                        MyButton(
                          text: "=",
                          color: Colors.deepOrange,
                          onPress: () {
                            setState(() {
                              equal();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
