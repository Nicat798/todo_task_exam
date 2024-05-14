import 'dart:io';

import 'package:dio/dio.dart';
import 'package:todo_exam/core/consts/app_strings.dart';
import 'package:todo_exam/model/todo_model.dart';

class ApiService {
  Future<List<TodoModel>> getTodoList() async {
    Dio dio = Dio(BaseOptions(baseUrl: AppStrings.apiBaseUrl));

    try {
      Response response = await dio.get(AppStrings.todos);

      if (response.statusCode == HttpStatus.ok) {
        List todoList = response.data as List;

        return todoList
            .map((currenModel) => TodoModel.fromJson(currenModel))
            .toList();
      } else {
        print("error. Status Code ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print(e);

      return [];
    }
  }
}
