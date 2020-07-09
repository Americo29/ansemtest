import 'package:ansemtest/src/providers/api_services.dart';

class ServicesRepository {
  final _apiService = ApiService();

  Future<Response> getServices() async {
    final result = await _apiService.getServices();
    return result;
  }
}
