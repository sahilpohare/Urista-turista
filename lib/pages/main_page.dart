import 'package:Turista/widgets/custom_ratingbar.dart';
import 'package:Turista/widgets/dashboardsublistview.dart';
import 'package:Turista/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:Turista/models/categories.dart' as categories;
import 'package:Turista/pages/card_deck_page.dart';
import 'package:Turista/widgets/custom_top_bar.dart';
import 'package:Turista/widgets/dashboard_listitems.dart';
import "package:Turista/models/test_images.dart" as imgs;

//import 'package:flutter/services.dart' as ll;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  AnimationController _controller;
  final GlobalKey<ScaffoldState> _sckey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sckey,
      drawer: SideDrawer(),
      bottomNavigationBar: SizedBox(height: 50,child: Stack(
        children: <Widget>[
          Container(color: Theme.of(context).accentColor,),
          Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(500)), gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter, colors: [Theme.of(context).accentColor,Colors.purple[600]])),),
        ],
      ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.purple, child: Icon(Icons.keyboard_arrow_up,color: Colors.white,size: 30,),
      ),
      appBar: CustomTopBar(
        padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
        title: Text("Turista",style: Theme.of(context).textTheme.title,),
        leading: IconButton(
          onPressed: (){
            _sckey.currentState.openDrawer();
          },
          icon: Icon(Icons.sort,size: 48),
        ),
        trail: IconButton(
          onPressed: (){},
          icon: Icon(Icons.center_focus_weak,size: 48),
        ),
      ),
      body: Container(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 3),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        DashBoardListItem(
                            title: "Browse By Mood",
                            subTitle: "Categories",
                            child: new Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: (){
                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>new CardDeckPage(title: categories.categories[index].title,)));
                                  },
                                  child: Card(
                                    elevation: 6,
                                    color: Theme.of(context).primaryColor,
                                    clipBehavior: Clip.hardEdge,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Image.network(
                                            categories.categories[index].imageUrl,
                                            fit: BoxFit.fitHeight,
                                            loadingBuilder: (context,child,loadingEvent){
                                              if(loadingEvent == null){
                                                return child;
                                              }
                                              return Center(
                                                child : CircularProgressIndicator(
                                                  value : loadingEvent.expectedTotalBytes != null ?
                                                    loadingEvent.cumulativeBytesLoaded/ loadingEvent.expectedTotalBytes : null
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Color.fromARGB(200, 212, 39, 241),
                                                  Color.fromARGB(30, 0, 0, 0),
                                                ]
                                              )
                                            ),
                                          ),
                                        ),
                                        Align(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,15),
                                            child: Hero(tag: categories.categories[index].title, child: Text(categories.categories[index].title,style: TextStyle(fontSize: 20),)),
                                          ),
                                          alignment: Alignment.bottomCenter,
                                        ),

                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.categories.length,
                              itemWidth: 160,
                              itemHeight: 220,
                              layout: SwiperLayout.STACK,
                            )
                        ),
                        DashBoardListItem(
                          title: "Places You\'ve",
                          subTitle: "Passed By",
                          child: SizedBox(
                            height: 200,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  DashBoardSubItem(data: new DashboardSubItemData(
                                    title: "Baga Beach",
                                    rating: 5,
                                    imageUrl: imgs.images[0],
                                    tags: ["party","2 Km"]
                                   ),
                                  ),
                                  DashBoardSubItem(data: new DashboardSubItemData(
                                    title: "Hirakud Dam",
                                    rating: 2,
                                    imageUrl: imgs.images[1],
                                    tags: ["heritage"]
                                   ),
                                  ),
                                  DashBoardSubItem(data: new DashboardSubItemData(
                                    title: "Titos",
                                    rating: 1,
                                    imageUrl: imgs.images[2],
                                    tags: ["party"]
                                   ),
                                  ),DashBoardSubItem(data: new DashboardSubItemData(
                                    title: "Hola",
                                    rating: 0,
                                    imageUrl: imgs.images[0],
                                    tags: ["heritage"]
                                   ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        DashBoardListItem(
                          title: "Places You\'ve",
                          subTitle: "Been To",
                          child: SizedBox(
                            height: 200,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  DashBoardSubItem(data: new DashboardSubItemData(
                                    title: "Baga Beach",
                                    rating: 5,
                                    imageUrl: imgs.images[0],
                                    tags: ["party"]
                                   ),
                                  ),
                                  DashBoardSubItem(data: new DashboardSubItemData(
                                    title: "Hirakud Dam",
                                    rating: 2,
                                    imageUrl: imgs.images[1],
                                    tags: ["heritage"]
                                   ),
                                  ),
                                  DashBoardSubItem(data: new DashboardSubItemData(
                                    title: "Titos",
                                    rating: 1,
                                    imageUrl: imgs.images[2],
                                    tags: ["party"]
                                   ),
                                  ),DashBoardSubItem(data: new DashboardSubItemData(
                                    title: "Hola",
                                    rating: 0,
                                    imageUrl: imgs.images[0],
                                    tags: ["heritage"]
                                   ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          color: Theme.of(context).accentColor
        ),
    );
  }
}


