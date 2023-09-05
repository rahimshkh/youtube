extension ListExtensions on List<int> {
  getSmallest() {
    if (isNotEmpty) {
      int smallest = this[0];
      for (int i in this) {
        if (smallest < this[i]) {
          smallest = this[i];
        }
      }
      return smallest;
    }
  }
}
