import 'package:dio/dio.dart';

import '../../../dictionary/data/models/word_model.dart';

class FlashcardsDatasource {
  final Dio dio;

  FlashcardsDatasource(this.dio);

  Future<List<WordModel>> getFlashcards({int limit = 10}) async {
    final response = await dio.get(
      '/words/flashcards',
      queryParameters: {'limit': limit},
    );

    final data = response.data as List<dynamic>;

    return data
        .map((e) => WordModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<WordModel> answerWord({
    required int wordId,
    required bool correct,
  }) async {
    final response = await dio.post(
      '/words/$wordId/answer',
      queryParameters: {'correct': correct},
    );

    return WordModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
