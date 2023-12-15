import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import '../ApiServices/api_services.dart';
// import 'secret_key.dart' as SecretKey;
import 'package:url_launcher/url_launcher.dart';

import '../ApiServices/secret_key.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void onClickGitHubLoginButton() async {
     String url = "https://github.com/login/oauth/authorize" +
        "?client_id=" + SecretKey.GITHUB_CLIENT_ID +
        "&scope=public_repo%20read:user%20user:email";
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(
        url as Uri,
        // forceSafariVC: false,
        // forceWebView: false,
      );
    } else {
      print("CANNOT LAUNCH THIS URL!");
    }
  }
  final AuthService authService = AuthService();
  StreamSubscription? _subs;
  @override
  void initState() {
    _initDeepLinkListener();
    super.initState();
  }
  @override
  void dispose() {
    _disposeDeepLinkListener();
    super.dispose();
  }
  void _initDeepLinkListener() async {
    _subs = linkStream.listen((String link) {
      _checkDeepLink(link);
    } as void Function(String? event)?, cancelOnError: true);
  }
  void _checkDeepLink(String link) {
    if (link != null) {
      String code = link.substring(link.indexOf(RegExp('code=')) + 5);
      authService.loginWithGitHub(code)
          .then((firebaseUser) {
        print(firebaseUser!.email!);
        print(firebaseUser.photoURL);
        // print("LOGGED IN AS: " + firebaseUser.displayName);
      }).catchError((e) {
        print("LOGIN ERROR: " + e.toString());
      });
    }
  }
  void _disposeDeepLinkListener() {
    if (_subs != null) {
      _subs!.cancel();
      _subs = null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(

        ),
      ),
    );
  }
}
