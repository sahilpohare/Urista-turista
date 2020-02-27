import 'package:Turista/models/tourEvent.dart';
import 'package:Turista/widgets/swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:Turista/models/test_images.dart' as imgs;
import 'package:Turista/models/categories.dart' as categories;
class SwipeDeck extends StatefulWidget {
  @override
  _SwipeDeckState createState() => _SwipeDeckState();
}

class _SwipeDeckState extends State<SwipeDeck>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<TourEvent> events = [
    TourEvent(title: "Baga Beach",mainImagePath: imgs.images[0],description: "Really Nice",tags: [Tag.withName("Beach")]),
    TourEvent(title: "Baga Beach",mainImagePath: imgs.images[0],description: "Really Nice",tags: [Tag.withName("Beach")]),
    TourEvent(title: "Baga Beach",mainImagePath: imgs.images[0],description: "Really Nice",tags: [Tag.withName("Beach")]),
  ];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CardController _controller;
    return Center(
      child: TinderSwapCard(
          totalNum: events.length,
          cardController: _controller,
          animDuration: 100,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.height * 0.9,
          minWidth: MediaQuery.of(context).size.width * 0.8,
          minHeight: MediaQuery.of(context).size.height * 0.8,
          cardBuilder: (context, index)=>SwipeCard(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
            ),),
          swipeCompleteCallback: (ori,n){
           
          },
    ),);
  }
}