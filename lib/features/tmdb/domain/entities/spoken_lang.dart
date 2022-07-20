import 'package:freezed_annotation/freezed_annotation.dart';

part 'spoken_lang.freezed.dart';

@freezed
class SpokenLang with _$SpokenLang {
  const factory SpokenLang({
    required String iso_639_1,
    required String name,
  }) = _SpokenLang;
}
