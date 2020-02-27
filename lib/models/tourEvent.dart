import 'dart:math';

import 'package:Turista/models/test_images.dart' as img;
import 'package:flutter/material.dart';

class TourEvent{
  final String title;
  final String description;
  final List<Tag> tags;
  final String mainImagePath;

  TourEvent({this.title, this.description, this.mainImagePath, this.tags});
}

class Tag{
    Color color;
    String name;
    Random random = new Random();
    Tag.withName(String name){
      this.name = name;
      color = _colorMap[name];
    }
    
    Tag.withNameAndCol(String name,Color col){
      this.name = name;
      if(_colorMap.containsKey(name)){
        this.color = _colorMap[name];
      }
      else{
        this.color = Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
      }
    }

    final Map _colorMap = {
      "party" : Color.fromARGB(255, 94, 0, 117),
      "heritage" : Color.fromARGB(255, 0, 117, 82),
      "2 Km" : Color.fromARGB(255, 0, 200, 82+100),
    };
}

List<TourEvent> events = [
  TourEvent(title: "Baga Beach", description: "Beach",mainImagePath:img.images[0],tags:[Tag.withName("party")]),
  TourEvent(title: "Baga Beach", description: "Beach",mainImagePath:img.images[2],tags:[Tag.withName("party")]),
  TourEvent(title: "Baga Beach", description: "Beach",mainImagePath:img.images[3],tags:[Tag.withName("party")]),
];
