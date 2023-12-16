import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_ui/ApiServices/secret_key.dart';
import 'package:http/http.dart' as http;
// import 'package:firebase_github_authentication/secret_keys.dart' as SecretKey;
import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:firebase_github_authentication/model/github_login_request.dart';
// import 'package:firebase_github_authentication/model/github_login_response.dart';

import '../Modules/github_repo_response.dart';
import '../Modules/github_user_response.dart';
import '../Modules/login_modules.dart';
import '../Utils/util.dart';
class AuthService {
  Dio dio = Dio();

  /*final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  //Firebase user create
  Future<auth.User?> loginWithGitHub(String code) async {
    //ACCESS TOKEN REQUEST
    final response = await http.post(
      "https://github.com/login/oauth/access_token" as Uri,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(GitHubLoginRequest(
        clientId: SecretKey.GITHUB_CLIENT_ID,
        clientSecret: SecretKey.GITHUB_CLIENT_SECRET,
        code: code,
      )),
    );
    GitHubLoginResponse loginResponse = GitHubLoginResponse.fromJson(json.decode(response.body));
//FIREBASE SIGNIN
    final auth.AuthCredential credential = auth.GithubAuthProvider.credential(loginResponse.accessToken!);

    final auth.User? user = (await _firebaseAuth.signInWithCredential(credential)).user;
    return user;
  }*/

  //get user from github authentication
  Future<GithubUserResponse?> getUsers() async {
    String mToken = await getAccessToken();
    print("Access Token: $mToken");
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        // Add authorization header
        options.headers['Authorization'] = "Bearer $mToken";
        return handler.next(options); // continue with the request
      },
    ));
    Response response = await dio.get(
      "https://api.github.com/user",
    );
    print("res:::" + response.data.toString());
    var data = GithubUserResponse.fromJson(response.data);
    print("responsedata:::" + data.toJson().toString());
    return data;
  }

  //get repo list from github authentication
  Future<List<UserResponse>?> getRepo() async {
    print("sdfdsfsd 1");
    String mToken = await getAccessToken();
    print("sdfdsfsd 2");
    print("Access Token: $mToken");
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        // Add authorization header
        options.headers['Authorization'] = "Bearer $mToken";
        return handler.next(options); // continue with the request
      },
    ));
    Response response = await dio.get(
      "https://api.github.com/user/repos",
    );
    print("sdfdsfsd 3");
    List<dynamic> result = response.data;
    print("res:::" + result.toString());
    print("res:::" + result.length.toString());
    if (result is List) {
      List<Map<String, dynamic>> resultList = List<Map<String, dynamic>>.from(
          result);
List<UserResponse> dataList=[];
      for (Map<String, dynamic> element in resultList) {
print("element");
print(element);
Map<String, dynamic> firstElement = element;
UserResponse data = UserResponse.fromJson(firstElement);
dataList.add(data);
      }

        return dataList;
      } else {
        return null;
      }
  }

}