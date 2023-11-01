extension ObjectUtils<T> on T {
  S let<S>(S Function(T) block) => block(this);
}