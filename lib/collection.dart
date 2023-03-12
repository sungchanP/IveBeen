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
    return Scaffold(
      body: SafeArea(
      bottom: false,
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2/3,
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
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