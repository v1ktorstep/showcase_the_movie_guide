import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_token.freezed.dart';

part 'request_token.g.dart';

@immutable
@freezed
class RequestToken with _$RequestToken {
  const factory RequestToken(
    @JsonKey(name: 'success') bool success,
    @JsonKey(name: 'expires_at') String expiresAt,
    @JsonKey(name: 'request_token') String requestToken,
  ) = _RequestToken;

  factory RequestToken.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenFromJson(json);
}
