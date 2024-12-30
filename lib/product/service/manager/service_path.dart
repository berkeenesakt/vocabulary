enum ServicePath {
  /// Auth
  login('login'),
  register('register'),

  /// Word
  random('random');

  final String value;
  const ServicePath(this.value);

  /// [withQuery] is add query to path
  ///
  /// Example: word/1
  String withQuery(String value) {
    return '${this.value}/$value';
  }
}
