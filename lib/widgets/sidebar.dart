import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String _title;
  final IconData _icon;
  DrawerItem(this._title,this._icon);
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){}, child: ListTile(leading: Icon(this._icon,color: Colors.white,size: 30,),title: Text(this._title,textAlign: TextAlign.center,style: Theme.of(context).textTheme.body1.copyWith(fontSize: 25)),));
  }
}

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Material(
          color: Colors.black,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(90)),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.horizontal(right: Radius.circular(50))),
            padding: EdgeInsets.symmetric(vertical: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DrawerItem("Profile", Icons.portrait),
                DrawerItem("Settings", Icons.settings),
                DrawerItem("Sign Out", Icons.exit_to_app),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

