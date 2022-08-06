import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_media.freezed.dart';

part 'favorite_media.g.dart';

@freezed
class FavoriteMedia with _$FavoriteMedia {
  const factory FavoriteMedia(
    @JsonKey(name: 'media_type') String mediaType,
    @JsonKey(name: 'media_id') int mediaId,
    @JsonKey(name: 'favorite') bool favorite,
  ) = _FavoriteMedia;

  factory FavoriteMedia.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMediaFromJson(json);
}
