extension ObjectUtils<T> on T {
  S let<S>(S Function(T) block) => block(this);

  S? asOrNull<S>() => this is S ? this as S : null;
}