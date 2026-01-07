import 'package:dio/dio.dart';

import '../models/word_model.dart';

class DictionaryRemoteDatasource {
  final Dio dio;

  DictionaryRemoteDatasource(this.dio);

  Future<List<WordModel>> getWords({
    String? topic,
    String? search,
  }) async {
    final response = await dio.get(
      '/words',
      queryParameters: {
        'status': 'ready',
        if (topic != null) 'topic': topic,
        if (search != null) 'search': search,
      },
    );

    return (response.data as List)
        .map((e) => WordModel.fromJson(e))
        .toList();
  }
}
