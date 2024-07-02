import 'package:http/http.dart';
import 'package:todo_app/model/ApiResponse.dart';
import 'package:todo_app/service/ApiService.dart';
import 'package:todo_app/widgets/utils.dart';

class UserService {
  ApiService apiService = ApiService();
  late Response response;

  Future<Response> userlogin(String email, String password) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };
    try {
      response = await apiService.post("login",body);
      // user = UserModel.fromJson(response.apiResponse);
    } catch (e) {
      Utils().toastmessage("Something went wrong!");
    }
    return response;
  }
}
