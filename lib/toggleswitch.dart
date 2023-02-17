import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

const double width = 300.0;
const double height = 40.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black;

class _ToggleButtonState extends State<ToggleButton> {
  double? xAlign;
  Color? moneyColor;
  Color? flagColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    moneyColor = selectedColor;
    flagColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Center(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
            //border: Border.all(style: BorderStyle.solid),
            boxShadow: [BoxShadow(
              color: Colors.black,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1.5),
            ),
            ]
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: Alignment(xAlign!, 0),
                duration: Duration(milliseconds: 150),
                child: Container(
                  width: width * 0.5,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    border: Border.all(style: BorderStyle.solid)
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    xAlign = loginAlign;
                    moneyColor = selectedColor;
                    flagColor = normalColor;
                  });
                },
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Icon(Icons.money_outlined, color: moneyColor,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    xAlign = signInAlign;
                    moneyColor = normalColor;
                    flagColor = selectedColor;
                  });
                },
                child: Align(
                  alignment: Alignment(1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Icon(Icons.flag_outlined, color: flagColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}