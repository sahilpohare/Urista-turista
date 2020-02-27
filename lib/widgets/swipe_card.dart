import 'package:Turista/models/test_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Turista/models/categories.dart' as categories;

class SwipeCard extends StatelessWidget {
  final Widget child;

  SwipeCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 100,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: <Widget>[
          Container(height: MediaQuery.of(context).size.height,child: Image.network(images[1],fit: BoxFit.fitHeight,),)
          ,
          Container(
            child: Align(alignment: Alignment.bottomCenter, child: SizedBox(height: 200, child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Baga Beach"),
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,end: Alignment.topCenter,colors: [Colors.grey[600],Colors.deepPurple])),),)))
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
    );
  }
}