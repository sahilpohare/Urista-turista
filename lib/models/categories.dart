var categories = [
  EventCategory(title: "Curated", imageUrl: "https://i.ytimg.com/vi/jjeKrgFG6gg/hqdefault.jpg",),
  EventCategory(title: "NightLife", imageUrl: "https://cdn4.vectorstock.com/i/1000x1000/03/78/silhouette-people-dancing-in-night-club-disco-vector-16980378.jpg"),
  EventCategory(title: "Party", imageUrl: "https://www.clipartkey.com/mpngs/m/251-2518735_1500-x-1500-2-party-time-png.png"),
  EventCategory(title: "Heritage", imageUrl: "http://www.vectorfreak.com/images/preview/taj-mahal-vector-illustration.jpg"),
  EventCategory(title: "Events", imageUrl: "https://cdn2.vectorstock.com/i/1000x1000/47/61/theater-masks-neon-sign-vector-23044761.jpg",),
];

class EventCategory {
  final String title;
  final String imageUrl;

  EventCategory({this.title, this.imageUrl});
}