import 'package:course_player/src/features/home/logic/model/model_course.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  Dio dio = Dio();

  Future<CourseModel> sendUrl(String url) async {
    Response response =
        await dio.get(url);
    return CourseModel.fromJson(response.data);
  }
}
