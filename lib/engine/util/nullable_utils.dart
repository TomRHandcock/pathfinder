extension NullableUtils<T> on T {
  T? takeIf(bool predicate) => predicate ? this : null;

  T? takeUnless(bool predicate) => predicate ? null : this;
}