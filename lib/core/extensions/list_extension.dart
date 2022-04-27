extension ListExtension<E> on List<E> {
  List<T> mapAsList<T>(T Function(E e) toElement) {
    return map(toElement).toList();
  }
}
