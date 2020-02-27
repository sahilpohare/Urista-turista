import 'package:Turista/models/tourEvent.dart';
import 'package:Turista/widgets/custom_ratingbar.dart';
import 'package:flutter/material.dart';

class DashBoardSubListView extends StatefulWidget {
  @override
  _DashBoardSubListViewState createState() => _DashBoardSubListViewState();
}

class _DashBoardSubListViewState extends State<DashBoardSubListView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DashBoardSubItem extends StatelessWidget {
  final DashboardSubItemData data;

  const DashBoardSubItem({Key key,this.data}) : super(key: key);

  List<Widget> chips(context){
    return data.tags.map((tag)=>Padding(
      padding: const EdgeInsets.only(right:5),
      child: SizedBox(height: 20,child: Center(child: Transform(transform: Matrix4.identity(), child: Chip(label: Transform( transform: Matrix4.identity()..setTranslationRaw(0, -6, 0), child: Text(tag)),labelStyle: Theme.of(context).textTheme.body2.copyWith(fontSize:15),backgroundColor: Tag.withName(tag).color,)))),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(data.imageUrl),
      ),
      title: Text(data.title,style: Theme.of(context).textTheme.body1.copyWith(fontSize: 25)),
      subtitle: Column(
        children: <Widget>[
          Row(children: chips(context),),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: RatingBar(rating : data.rating),
          ),
        ],
      ),
    );
  }
}
class DashboardSubItemData{

  final List<String> tags;
  final String imageUrl;
  final String title;
  final int rating;

  DashboardSubItemData({this.rating,this.tags,this.title,this.imageUrl});
}