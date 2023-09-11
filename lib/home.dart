import 'package:cal/components/my_button.dart';
import 'package:cal/constants.dart';
import 'package:flutter/material.dart';
import 'package:cal/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onPress: () {
                            userInput = ' ';
                            answer = ' ';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '%',
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '/',
                            onPress: () {
                              userInput += '/';
                              setState(() {

                              });
                            },
                            color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: 'x',
                            onPress: () {
                              userInput += '*';
                              setState(() {

                              });
                            },
                            color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: '5',
                          onPress: () {
                            userInput +='5';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                            title: '-',
                            onPress: () {
                              userInput += '-';
                              setState(() {

                              });
                            },
                            color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                            title: '+',
                            onPress: () {
                              userInput += "+";
                              setState(() {

                              });
                            },
                            color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: '.',
                          onPress: () {
                            userInput +='.';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: 'DEL',
                          onPress: () {
                            userInput = userInput.substring(0, userInput.length-1);
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                            title: '=',
                            onPress: (){
                              equalPress();
                              setState(() {

                              });
                            },
                            color: Color(0xffffa00a)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress (){
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

// children: [
// SizedBox(height: 10,),
// MyButton(title: 'Login', subtitle: ' gandmara',),
//
// MyButton(title: 'Fuck off', subtitle: ' maderchod',),
// ],

// class MyButton extends StatelessWidget {
//   final String title, subtitle;
//   const MyButton({super.key, required this.title, required this.subtitle});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Container(
//         height: 50,
//
//         decoration: BoxDecoration(
//           color: Colors.deepOrange,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Center(child: Text(title + subtitle , style: TextStyle(fontSize: 18, color: whiteColor), )),
//       ),
//     );
//   }
// }
