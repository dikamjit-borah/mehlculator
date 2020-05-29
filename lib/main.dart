import 'dart:math';
import 'package:math_expressions/math_expressions.dart';

import 'package:flutter/material.dart';
void main()
{
  runApp(Mehlculator());
}

class Mehlculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "meh",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: TheCalculator(),
    );
  }
}

class TheCalculator extends StatefulWidget {
  @override
  _TheCalculatorState createState() => _TheCalculatorState();
}

class _TheCalculatorState extends State<TheCalculator> {

  String equation = "0";
  String result = "Result";
  when_pressed(String button_text) {

    setState(() {
      if(button_text == "C")
      {
        equation = "0";
        result = "0";
      }
      else if(button_text == "DEL")
      {
          equation = equation.substring(0, equation.length - 1);
          if(equation.isEmpty)
            {
              equation = "0";
            }
      }
      else if(button_text == "=")
      {

        try{
            
          Parser p = new Parser();
          Expression expression = p.parse(equation);
          ContextModel contextModel = ContextModel();
          result = '${expression.evaluate(EvaluationType.REAL, contextModel)}';
        }
        catch(e)
      {
        result = "Something's not right!";
      }
      }
      else
      {
        if(equation == "0")
        {
          equation = button_text;
        }
        else
        {
          equation = equation + button_text;
        }
      }
    });
  }
  Widget button_1(String button_text, double button_height, Color button_color)
  {
    return Container(
      height: MediaQuery.of(context).size.height*0.1*button_height,
      color: button_color,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(0)), padding: EdgeInsets.all(10),

          onPressed:()=> when_pressed(button_text), child:  Text(button_text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mehlculator')),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            color: Colors.amberAccent,
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: 18.0),),
          ),
          Container(
            margin: EdgeInsets.all(8),
            color: Colors.amberAccent,
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(result, style: TextStyle(fontSize: 22.0),),
          ),
          Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                              button_1("C", 1, Colors.red),
                              button_1("DEL", 1, Colors.deepOrange),
                              button_1("+", 1, Colors.green)
                      ]
                    ),
                    TableRow(
                        children: [
                          button_1("7", 1, Colors.black87),
                          button_1("8", 1, Colors.black87),
                          button_1("9", 1, Colors.black87)
                        ]
                    ),TableRow(
                        children: [
                          button_1("4", 1, Colors.black87),
                          button_1("5", 1, Colors.black87),
                          button_1("6", 1, Colors.black87)
                        ]
                    ),TableRow(
                        children: [
                          button_1("1", 1, Colors.black87),
                          button_1("2", 1, Colors.black87),
                          button_1("3", 1, Colors.black87)
                        ]
                    ), TableRow(
                        children: [

                          button_1("00", 1, Colors.black45),
                          button_1("0", 1, Colors.black87),
                          button_1(".", 1, Colors.black45)
                        ]
                    )
                  ]
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        button_1("-", 1, Colors.green)
                      ]
                    ), TableRow(
                        children: [
                          button_1("/", 1, Colors.green)
                        ]
                    ),TableRow(
                        children: [
                          button_1("*", 1, Colors.green)
                        ]
                    ),
                    TableRow(
                        children: [
                          button_1("=", 2, Colors.blue)
                        ]
                    )

                  ],
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text("Developed with ❤ by HOBARB")],
            mainAxisAlignment: MainAxisAlignment.center,
          )


        ],
      ),
    );
  }
}
