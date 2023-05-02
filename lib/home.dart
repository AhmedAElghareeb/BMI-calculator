import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController n1 = new TextEditingController();
  TextEditingController n2 = new TextEditingController();
  dynamic x = Text("");
  dynamic y = Text("");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Body Mass Index (BMI)",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
          children:
          [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: n1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "HEIGHT",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: n2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "WEIGHT",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: ()
                  {
                    String z = n1.text;
                    String h = n2.text;
                    int a = int.parse(z);
                    int b = int.parse(h);

                    setState(()
                    {
                      double result = b / pow(a/100, 2);
                      if (result <= 18.5)
                        {
                          x = Image.asset("images/bmi_underweight.png");
                          y = Text("Under Weight", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,));
                        }
                      else if (result > 18.5 && result <= 25)
                        {
                          x = Image.asset("images/bmi_normal.png");
                          y = Text("Normal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,));
                        }
                      else if (result > 25 && result <= 30)
                      {
                        x = Image.asset("images/bmi_overweight.png");
                        y = Text("Over Weight", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,));
                      }
                      else if (result > 30 && result <= 35)
                      {
                        x = Image.asset("images/bmi_obesity.png");
                        y = Text("Obese Class I", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,));
                      }
                      else if (result > 35 && result <= 40)
                      {
                        x = Image.asset("images/bmi_obesity.png");
                        y = Text("Obese Class II", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,));
                      }
                      else if (result > 40)
                      {
                        x = Image.asset("images/bmi_extremeobesity.png");
                        y = Text("Obese Class III", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,));
                      }
                    });
                  },
                  height: 50.0,
                  child: Text(
                      "CALCULATE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    x,
                    Container(height: 10),
                    y,
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}