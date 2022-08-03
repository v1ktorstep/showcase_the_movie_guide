import 'package:showcase_the_movie_guide/features/account/domain/entities/account_details.dart';

abstract class IAccountRepository {
  Future<AccountDetails> loadAccountDetails();
}