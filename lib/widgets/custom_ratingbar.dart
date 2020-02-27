import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  final int rating;
  RatingBar({Key key,this.rating}) : super(key: key);

  @override
  _RatingBarState createState() => _RatingBarState(this.rating);
}

class _RatingBarState extends State<RatingBar> {
  int rating = 0;
  _RatingBarState(this.rating);
  @override
  Widget build(BuildContext context) {
    return Row(
       children: <Widget>[
         star(0),
         star(1),
         star(2),
         star(3),
         star(4),
       ],
    );
  }

  Icon star(int index){
    if(index+1 < rating){
      return Icon(Icons.star,size: 19,);
    }else{
      return Icon(Icons.star_border,size: 19,);
    }
  }
}

