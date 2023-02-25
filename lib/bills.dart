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
const Color normalColor = Color.fromARGB(255, 9, 158, 19);

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
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1/2,
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        children: [
          Image.asset('banknotes/afghan.jpeg',fit: BoxFit.fill,),
          Image.asset('banknotes/albania.jpeg',fit: BoxFit.fill,),
          Image.asset('banknotes/algeria.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/angola.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/argentina.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/armenia.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Aruba.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/australia.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Azerbaijan.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Bahamas.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Bahraini.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Bangladeshi.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Barbados.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Belarusian.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Belize.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Bermudian.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Bhutanese.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Bolivia.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Bosnia and Herzegovina.jpeg',fit: BoxFit.fill),
          Image.asset('banknotes/Botswana.jpeg',fit: BoxFit.fill),
        ],
      ),
    );
  }

  Widget getFlagsWidget() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2/3,
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        children: [
          Image.asset('flags/South Korea.png', fit: BoxFit.cover,),
          Image.asset('flags/Afghanistan.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Albania.png', fit: BoxFit.cover,),
          Image.asset('flags/Algeria.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Andorra.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Angola.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Antigua and Barbuda.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Argentina.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Armenia.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Aruba.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Australia.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Austria.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Azerbaijan.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Bahamas.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Bahrain.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Bangladesh.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Barbados.jpeg', fit: BoxFit.cover,),
          Image.asset('flags/Belarus.jpeg', fit: BoxFit.fill,),
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
              Row(
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
                        color: Color.fromARGB(248, 33, 150, 33),
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
                              color: Color.fromARGB(255, 9, 158, 19),
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
                  // SizedBox(
                  //   width: 30,
                  //   height: 30,
                  //   child: MyBlinkingButton()
                  // )
                ],
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





// class MyBlinkingButton extends StatefulWidget {
//     @override
//     _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
//   }

//   class _MyBlinkingButtonState extends State<MyBlinkingButton>
//       with SingleTickerProviderStateMixin {
//     AnimationController? _animationController;

//     @override
//     void initState() {
//       _animationController =
//           new AnimationController(vsync: this, duration: Duration(seconds: 1));
//       _animationController!.repeat(reverse: true);
//       super.initState();
//     }

//     @override
//     Widget build(BuildContext context) {
//       return FadeTransition(
//         opacity: _animationController!,
//         child: MaterialButton(
//           onPressed: () => null,
//           color: Colors.green,
//           shape: CircleBorder(),
//         ),
//       );
//     }

//     @override
//     void dispose() {
//       _animationController!.dispose();
//       super.dispose();
//     }
//   }