import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

part 'session.g.dart';

@freezed
class Session with _$Session {
  const factory Session(
    @JsonKey(name: 'success') bool success,
    @JsonKey(name: 'session_id') String sessionId,
  ) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
