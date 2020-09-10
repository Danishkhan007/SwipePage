class SwipeCount {
  int count = -1;

  void increaseCount()  {
    if (count == 4) {
      count = 0;
    } else {
      count ++;
    }
  }
}