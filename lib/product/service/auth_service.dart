import 'package:vocabulary/product/service/manager/service_manager.dart';
import 'package:vocabulary/product/service/manager/service_path.dart';

class AuthService {
  static Future<String> login(String email, String password) async {
    final manager = ServiceManager();
    try {
      final response = await manager.post<Map<String, dynamic>>(
        ServicePath.login.value,
        data: {
          'email': email,
          'password': password,
        },
      );
      return response!['token'].toString();
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> register(String username, String password, String email) async {
    final manager = ServiceManager();
    try {
      final response = await manager.post<Map<String, dynamic>>(
        ServicePath.register.value,
        data: {
          'username': username,
          'password': password,
          'email': email,
        },
      );
      return response!['token'].toString();
    } catch (e) {
      rethrow;
    }
  }
}
