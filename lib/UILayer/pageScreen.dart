import 'package:SwipePage/BLoC/swipe_bloc.dart';
import 'package:flutter/material.dart';

class PageScreen extends StatelessWidget {
  final int pageNumber;
  final Function callback;
  const PageScreen({Key key, this.pageNumber, this.callback}) : super(key: key);@override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.blue,
          child: Column(
                        
           children: [
             Spacer(),
               Text('Page '+ pageNumber.toString()),
             Spacer(),
            RaisedButton(
              onPressed: (){
                //updating page swipe count with bloc.
                bloc.updateSwipeCount();
                callback(bloc.getCurrentValue());
              },
              child: Text("Next"),
            ),
            
            ]
          ),
              );
  }
}