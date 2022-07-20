import 'package:freezed_annotation/freezed_annotation.dart';

part 'prod_country.freezed.dart';

@freezed
class ProdCountry with _$ProdCountry {
  const factory ProdCountry({
    required String iso_3166_1,
    required String name,
  }) = _ProdCountry;
}
