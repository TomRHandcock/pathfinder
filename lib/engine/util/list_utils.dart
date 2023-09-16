extension ListUtils<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) predicate) {
    try {
      return firstWhere(predicate);
    } on StateError catch(_) {
      return null;
    }
  }
}