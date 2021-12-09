import 'package:drawer_swipe/drawer_swipe.dart';
import 'package:flutter/material.dart';
import 'package:learning/Flutter_Packages/Flutter_Login_Packages/home.dart';

class SwipeDrawerExample extends StatefulWidget {
  @override
  _SwipeDrawerExampleState createState() => _SwipeDrawerExampleState();
}

class _SwipeDrawerExampleState extends State<SwipeDrawerExample> {
  var drawerKey = GlobalKey<SwipeDrawerState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // add this line so you can add your appBar in Body
      extendBodyBehindAppBar: true,
      body: SwipeDrawer(
        radius: 20,
        key: drawerKey,

        hasClone: false,
        bodyBackgroundPeekSize: 30,
        backgroundColor: Colors.red,
        // pass drawer widget
        drawer: buildDrawer(),
        // pass body widget
        child: buildBody(),
      ),
    );
  }

  Widget buildDrawer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Title'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
            },
          ),
          ListTile(
            title: Text('Title'),
          ),
          ListTile(
            title: Text('Title'),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        // build your appBar
        AppBar(
          title: Text('AppBar title'),
          leading: InkWell(
              onTap: () {
                if (drawerKey.currentState.isOpened()) {
                  drawerKey.currentState.closeDrawer();
                } else {
                  drawerKey.currentState.openDrawer();
                }
              },
              child: Icon(Icons.menu)),
        ),
        // build your screen body
        Expanded(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text('Home Screen'),
            ),
          ),
        ),
      ],
    );
  }
}