import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/spoken_lang.dart';

part 'spoken_lang_model.freezed.dart';

part 'spoken_lang_model.g.dart';

@freezed
class SpokenLangModel with _$SpokenLangModel {
  const SpokenLangModel._();

  const factory SpokenLangModel(
    @JsonKey(name: 'iso_639_1') String iso_639_1,
    @JsonKey(name: 'name') String name,
  ) = _SpokenLangModel;

  factory SpokenLangModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLangModelFromJson(json);

  SpokenLang toDomain() {
    return SpokenLang(iso_639_1: iso_639_1, name: name);
  }
}
