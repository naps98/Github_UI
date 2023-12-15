import 'dart:convert';
import 'package:github_ui/ApiServices/secret_key.dart';
import 'package:http/http.dart' as http;
// import 'package:firebase_github_authentication/secret_keys.dart' as SecretKey;
import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:firebase_github_authentication/model/github_login_request.dart';
// import 'package:firebase_github_authentication/model/github_login_response.dart';

import '../Modules/login_modules.dart';
class AuthService{
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
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
  }
}