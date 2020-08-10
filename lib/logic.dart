import 'package:flutter/material.dart';

class LogicalPage extends StatefulWidget {
  @override
  _LogicalPageState createState() => _LogicalPageState();
}

class _LogicalPageState extends State<LogicalPage> {
  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operationtoperform;

  void btnclicked(String btntext) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text("Output"),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("!"),
                custombutton("x²"),
                custombutton("x³"),
                custombutton("√"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("1/x"),
                custombutton("∛"),
                custombutton("x^y"),
                custombutton("|x|"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("2^x"),
                custombutton("π"),
                custombutton("ε"),
                custombutton("ln")
              ],
            )
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
