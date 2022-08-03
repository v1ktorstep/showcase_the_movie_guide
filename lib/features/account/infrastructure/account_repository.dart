import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/account_details.dart';
import 'package:showcase_the_movie_guide/features/account/domain/i_account_repository.dart';
import 'package:showcase_the_movie_guide/features/account/infrastructure/account_service.dart';

@LazySingleton(as: IAccountRepository)
class AccountRepository implements IAccountRepository {
  final AccountService _accountService;

  AccountRepository(this._accountService);

  @override
  Future<AccountDetails> loadAccountDetails() async {
    return await _accountService.accountDetails();
  }
}
