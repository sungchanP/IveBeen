import 'package:flutter/material.dart';

enum WidgetMaker {bills, flags}

class Bills extends StatefulWidget {
  const Bills ({super.key});

  @override
  State<Bills> createState() => _BillsState();
}


const double width = 200.0;
const double height = 35.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.red;

class _BillsState extends State<Bills> {

  double? xAlign;
  Color? moneyColor;
  Color? flagColor;

  WidgetMaker selectedWidgetMaker = WidgetMaker.bills;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    moneyColor = selectedColor;
    flagColor = normalColor;
  }

  Widget getWidget() {
    switch(selectedWidgetMaker){
      case WidgetMaker.bills:
      return getBillsWidget();
      case WidgetMaker.flags:
      return getFlagsWidget();
    }
  }

  Widget getBillsWidget() {
    return Expanded(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1/2,
        ),
        //padding: EdgeInsets.only(top: 60.0),
        children: [
          Image.asset('banknotes/afghan.jpeg'),
          Image.asset('banknotes/albania.jpeg'),
          Image.asset('banknotes/algeria.jpeg'),
          Image.asset('banknotes/angola.jpeg'),
          Image.asset('banknotes/argentina.jpeg'),
          Image.asset('banknotes/armenia.jpeg'),
          Image.asset('banknotes/Aruba.jpeg'),
          Image.asset('banknotes/australia.jpeg'),
          Image.asset('banknotes/Azerbaijan.jpeg'),
          Image.asset('banknotes/Bahamas.jpeg'),
          Image.asset('banknotes/Bahraini.jpeg'),
          Image.asset('banknotes/Bangladeshi.jpeg'),
          Image.asset('banknotes/Barbados.jpeg'),
          Image.asset('banknotes/Belarusian.jpeg'),
          Image.asset('banknotes/Belize.jpeg'),
          Image.asset('banknotes/Bermudian.jpeg'),
          Image.asset('banknotes/Bhutanese.jpeg'),
          Image.asset('banknotes/Bolivia.jpeg'),
          Image.asset('banknotes/Bosnia and Herzegovina.jpeg'),
          Image.asset('banknotes/Botswana.jpeg'),
        ],
      ),
    );
  }

  Widget getFlagsWidget() {
    return Expanded(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1/2,
        ),
        //padding: EdgeInsets.only(top: 60.0),
        children: [
          Image.asset('flags/Afghanistan.jpeg'),
          Image.asset('flags/Albania.png'),
          Image.asset('flags/Algeria.jpeg'),
          Image.asset('flags/Andorra.jpeg'),
          Image.asset('flags/Angola.jpeg'),
          Image.asset('flags/Antigua and Barbuda.jpeg'),
          Image.asset('flags/Argentina.jpeg'),
          Image.asset('flags/Armenia.jpeg'),
          Image.asset('flags/Aruba.jpeg'),
          Image.asset('flags/Australia.jpeg'),
          Image.asset('flags/Austria.jpeg'),
          Image.asset('flags/Azerbaijan.jpeg'),
          Image.asset('flags/Bahamas.jpeg'),
          Image.asset('flags/Bahrain.jpeg'),
          Image.asset('flags/Bangladesh.jpeg'),
          Image.asset('flags/Barbados.jpeg'),
          Image.asset('flags/Belarus.jpeg'),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  //border: Border.all(style: BorderStyle.solid),
                  boxShadow: [BoxShadow(
                    color: Colors.pinkAccent,
                    spreadRadius: 1,
                    blurRadius: 0,
                    offset: Offset(0, 1.5),
                  ),
                  ]
                ),
                child: Stack(
                  children: <Widget>[
                    AnimatedAlign(
                      alignment: Alignment(xAlign!, 0),
                      duration: Duration(milliseconds: 150),
                      child: Container(
                        width: width * 0.5,
                        height: height,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                          //border: Border.all(style: BorderStyle.solid)
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = loginAlign;
                          moneyColor = selectedColor;
                          flagColor = normalColor;

                          selectedWidgetMaker = WidgetMaker.bills;
                        });
                      },
                      child: Align(
                        alignment: Alignment(-1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Icon(Icons.money_outlined, color: moneyColor),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = signInAlign;
                          moneyColor = normalColor;
                          flagColor = selectedColor;

                          selectedWidgetMaker = WidgetMaker.flags;
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
              SizedBox(height: 15,),
              Container(
                child: getWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}