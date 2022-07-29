import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details.freezed.dart';

part 'account_details.g.dart';

@freezed
class AccountDetails with _$AccountDetails {
  const factory AccountDetails(
    @JsonKey(name: 'avatar') Avatar avatar,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'iso_639_1') String iso_639_1,
    @JsonKey(name: 'iso_3166_1') String iso_3166_1,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'include_adult') bool includeAdult,
    @JsonKey(name: 'username') String username,
  ) = _AccountDetails;

  factory AccountDetails.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsFromJson(json);
}

@freezed
class Avatar with _$Avatar {
  const factory Avatar(
    @JsonKey(name: 'gravatar') Gravatar gravatar,
  ) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}

@freezed
class Gravatar with _$Gravatar {
  const factory Gravatar(
    @JsonKey(name: 'hash') String hash,
  ) = _Gravatar;

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);
}
