import 'dart:async';

import 'package:dio/dio.dart';

import '../Modules/branches_response.dart';
import '../Modules/github_project_response.dart';
import '../Modules/github_repo_response.dart';
import '../Modules/github_user_response.dart';
import '../Utils/util.dart';

class AuthService {
  Dio dio = Dio();

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
      List<Map<String, dynamic>> resultList =
          List<Map<String, dynamic>>.from(result);
      List<UserResponse> dataList = [];
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

  //get repo list from github authentication
  Future<GithubProjectCommitResponse?> getProjectDetails(url) async {
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
      "$url",
    );
    print("sdfdsfsd 3");
    print("$url");
    print("res:::" + response.data.toString());
    var data = GithubProjectCommitResponse.fromJson(response.data);
    print("responsedata:::" + data.toJson().toString());
    return data;
  }

  //get branch list from github authentication
  Future<List<Branches>?> getProjectBranch(unAndPn) async {
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
      "https://api.github.com/repos/$unAndPn/branches",
    );
    print("sdfdsfsd 3");
    List<dynamic> result = response.data;
    print("res:::" + result.toString());
    print("res:::" + result.length.toString());
    if (result is List) {
      List<Map<String, dynamic>> resultList =
          List<Map<String, dynamic>>.from(result);
      List<Branches> dataList = [];
      for (Map<String, dynamic> element in resultList) {
        print("element");
        print(element);
        Map<String, dynamic> firstElement = element;
        Branches data = Branches.fromJson(firstElement);
        dataList.add(data);
      }

      return dataList;
    } else {
      return null;
    }
  }
}
