import 'package:gen/gen.dart';
import 'package:vocabulary/product/service/manager/service_manager.dart';
import 'package:vocabulary/product/service/manager/service_path.dart';

class WordService {
  static Future<WordModel> fetchWord() async {
    final manager = ServiceManager();
    try {
      final response = await manager.get<Map<String, dynamic>>(ServicePath.random.value);
      return WordModel.fromJson(response!['word'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
