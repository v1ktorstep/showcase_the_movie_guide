import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/prod_company.dart';

part 'prod_company_model.freezed.dart';

part 'prod_company_model.g.dart';

@freezed
class ProdCompanyModel with _$ProdCompanyModel {
  const ProdCompanyModel._();

  const factory ProdCompanyModel(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'logo_path') String? logoPath,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'origin_country') String originCountry,
  ) = _ProdCompanyModel;

  factory ProdCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProdCompanyModelFromJson(json);

  ProdCompany toDomain() {
    return ProdCompany(
      id: id,
      logoPath: logoPath,
      name: name,
      originCountry: originCountry,
    );
  }
}
