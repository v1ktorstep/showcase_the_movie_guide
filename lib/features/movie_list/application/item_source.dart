import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_source.freezed.dart';

@freezed
class ItemSource<T> with _$ItemSource<T> {
  const factory ItemSource({
    required String key,
    required Future<T> Function({required int page}) source,
    T? preloaded,
  }) = _ItemSource<T>;
}
