import 'package:SwipePage/BLoC/swipe_bloc.dart';
import 'package:SwipePage/UILayer/pageScreen.dart';
import 'package:flutter/material.dart';

class SwipeScreen extends StatefulWidget {
  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  int currentPageValue = 1;
 final PageController ctrl = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.updateSwipeCount();
  }

  void callback(int page) {
    ctrl.animateToPage(page, duration: Duration(milliseconds: 1000), curve: Curves.linear);
    setState(() {
      currentPageValue = page;
    });
    // ctrl.animateTo((page).toDouble(), duration: Duration(milliseconds: 1000), curve: null);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.getSwipeCount,
      builder: (context, snapshot) {
       print(snapshot.data);
        return Scaffold(
          body: Container(
             child: Stack(children: <Widget>[
            
              PageView(
              physics: NeverScrollableScrollPhysics() ,
              controller: ctrl,
              
              onPageChanged: (page) {
                // this.setState(() {
                //   currentPageValue = snapshot.data;
                // });
              },
              children: [
                
                  PageScreen(callback: callback, pageNumber: 1),
                  PageScreen(callback: callback, pageNumber: 2),
                  PageScreen(callback: callback, pageNumber: 3),
                  PageScreen(callback: callback, pageNumber: 4),
                  PageScreen(callback: callback, pageNumber: 5),

                //  loginScreen(context)
              ]
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              child: slideIndicator()
              )
              ]    
            
        )
        
          )

          );
      }
    );
  }

   Widget slideIndicator() {
   return Stack(
  children: <Widget>[
    Container(
      margin: EdgeInsets.only(bottom: 35),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < 5; i++)
            if (i == currentPageValue) ...[circleBar(true)] else
              circleBar(false),
        ],
      ),
    ),
  ],
);
  }


  Widget circleBar(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 18 : 12,
    width: isActive ? 18 : 12,
    decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(12))),
  );
}
}

 