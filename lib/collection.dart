import 'package:flutter/material.dart';
import 'flagUrlList.dart' as global;

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();

}

class _CollectionState extends State<Collection> {
  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height- MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
      bottom: false,
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: screenHeight*0.01,
              crossAxisSpacing: screenWidth*0.02,
              childAspectRatio: 2/3,
              padding: EdgeInsets.only(left: screenWidth*0.015, right: screenWidth*0.015),
              children: [
                for (var url in global.flagurlList) Image.network(url, fit: BoxFit.cover,)
              ]
              )
            ),
        ],
      ),
      ),
    );
  }
}