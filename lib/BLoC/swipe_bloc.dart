import 'dart:async';

import 'package:SwipePage/DataLayer/swipeCount.dart';

final bloc = SwipeBloc();


class SwipeBloc {
  final swipeCountController = StreamController<int>();

  //Stream, to fetch
  Stream<int> get getSwipeCount => swipeCountController.stream;
  SwipeCount swipe = SwipeCount();
  //Sink, to update
  void updateSwipeCount() {
    swipe.increaseCount();
    swipeCountController.sink.add(swipe.count);
  }

  int getCurrentValue() => swipe.count;

  //to avoid data leak
  void dispose() {
    swipeCountController.close();
  }

}