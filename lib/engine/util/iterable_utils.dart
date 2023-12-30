extension DeepIterableUtils<T> on Iterable<Iterable<T>> {
  List<T> flatten() =>
      fold([], (previousValue, element) => previousValue + element.toList());
}