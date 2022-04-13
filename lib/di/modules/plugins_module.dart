import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PluginsModule {
  @LazySingleton()
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();
}