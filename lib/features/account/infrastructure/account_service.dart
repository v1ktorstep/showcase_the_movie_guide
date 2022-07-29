import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:showcase_the_movie_guide/core/constants.dart';
import 'package:showcase_the_movie_guide/core/di/modules/dio_module.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/account_details.dart';

part 'account_service.g.dart';

@LazySingleton()
@RestApi(baseUrl: '${Constants.tmdbApiUrl}/account/')
abstract class AccountService {
  @factoryMethod
  factory AccountService(@Named(kDioAuth) Dio dio) = _AccountService;

  @GET('/')
  Future<AccountDetails> accountDetails();
}
