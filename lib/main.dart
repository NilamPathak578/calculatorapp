import 'package:flutter/material.dart';
import 'package:calculatorapp/logic.dart';
// import 'dart:math' as math;
// import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData.dark(),
      home: CalculatorApp(),
    ));

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operationtoperform;

  void btnclicked(String btntext) {
    if (btntext == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btntext == "⌫") {
      res = res.substring(0, texttodisplay.length - 1);
    } else if (btntext == "%") {
      firstnum = int.parse(texttodisplay);
      res = (firstnum / 100).toString();
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "*" ||
        btntext == "/") {
      firstnum = int.parse(texttodisplay);
      secondnum = int.parse(texttodisplay);
      res = "";
      operationtoperform = btntext;
    } else if (btntext == "=") {
      secondnum = int.parse(texttodisplay);
      if (operationtoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operationtoperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operationtoperform == "*") {
        res = (firstnum * secondnum).toString();
      }
      if (operationtoperform == "/") {
        res = (firstnum / secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btntext).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CalculatorApp"),
        titleSpacing: 2.0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogicalPage()));
                    })
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("⌫"),
                custombutton("%"),
                custombutton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("."),
                custombutton("0"),
                custombutton("00"),
                custombutton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(20.0),
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
