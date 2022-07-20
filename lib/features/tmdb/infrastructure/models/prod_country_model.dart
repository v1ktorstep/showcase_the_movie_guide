import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/prod_country.dart';

part 'prod_country_model.freezed.dart';

part 'prod_country_model.g.dart';

@freezed
class ProdCountryModel with _$ProdCountryModel {
  const ProdCountryModel._();

  const factory ProdCountryModel(
    @JsonKey(name: 'iso_3166_1') String iso_3166_1,
    @JsonKey(name: 'name') String name,
  ) = _ProdCountryModel;

  factory ProdCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ProdCountryModelFromJson(json);

  ProdCountry toDomain() {
    return ProdCountry(iso_3166_1: iso_3166_1, name: name);
  }
}
