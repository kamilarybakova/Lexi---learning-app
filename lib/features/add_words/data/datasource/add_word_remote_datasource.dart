import 'package:dio/dio.dart';
import '../../../dictionary/data/models/word_model.dart';

class AddWordRemoteDatasource {
  final Dio dio;

  AddWordRemoteDatasource(this.dio);

  Future<List<WordModel>> addWords(String rawText) async {
    final response = await dio.post(
      '/words/process',
      data: {
        'raw_text': rawText,
      },
    );

    return (response.data as List)
        .map((e) => WordModel.fromJson(e))
        .toList();
  }
}
