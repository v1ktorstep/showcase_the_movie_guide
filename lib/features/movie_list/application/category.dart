import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class Category<T> with _$Category<T> {
  const factory Category({
    required String key,
    required ItemSource<T> source,
    T? preloaded,
  }) = _Category<T>;
}

typedef ItemSource<T> = Future<T> Function({required int page});
