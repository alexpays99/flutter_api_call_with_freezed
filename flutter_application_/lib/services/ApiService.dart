import 'package:dio/dio.dart';
import 'package:flutter_application_/models/user/user.dart';

class ApiService {
  final Dio dio = Dio();
  List<User> users = [];

  Future<void> fetchUsers() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
    );
    print(response.data);

    final List list = response.data;
    users = list.map((e) => User.fromJson(e)).toList();
  }
}
