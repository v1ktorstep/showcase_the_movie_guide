import 'package:freezed_annotation/freezed_annotation.dart';

part 'prod_company.freezed.dart';

@freezed
class ProdCompany with _$ProdCompany {
  const factory ProdCompany({
    required int id,
    required String? logoPath,
    required String name,
    required String originCountry,
  }) = _ProdCompany;
}
