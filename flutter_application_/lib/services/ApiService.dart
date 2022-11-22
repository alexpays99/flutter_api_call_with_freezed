import 'package:dio/dio.dart';
import 'package:flutter_application_/models/user/user.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<dynamic>> fetchUsers() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
    );
    print(response.data);

    return response.data;
  }
}
