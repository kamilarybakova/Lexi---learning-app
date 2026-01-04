import 'package:dio/dio.dart';

import '../utils/app_config.dart';
import 'logging_interceptor.dart';

final dio = Dio(BaseOptions(
  baseUrl: AppConfig.apiBaseUrl,
  connectTimeout: const Duration(seconds: 15),
))
  ..interceptors.add(LoggingInterceptor());
