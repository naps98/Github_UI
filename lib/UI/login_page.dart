import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in_plus/github_sign_in_plus.dart';
import 'package:github_ui/UI/home_page.dart';

import '../Utils/util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GitHubSignIn gitHubSignIn = GitHubSignIn(
    clientId: 'ea177fbb1008ce0c2369',
    clientSecret: '8849b2597b55c8e78ab455d19e85dd92d0fc5317',
    redirectUrl: 'https://github-ui-2e13c.firebaseapp.com/__/auth/handler',
    title: 'GitHub UI',
    centerTitle: false,
  );

  @override
  void initState() {
    super.initState();
  }

  void _gitHubSignIn(BuildContext context) async {
    var result = await gitHubSignIn.signIn(context);
    switch (result.status) {
      case GitHubSignInResultStatus.ok:
        print("user status: " + result.status.toString());
        print("user token: " + result.token.toString());
        if (result.status == GitHubSignInResultStatus.ok &&
            result.token != null) {
          setAccessToken(result.token!);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          print('GitHub sign-in failed or token is null');
        }
        break;

      case GitHubSignInResultStatus.cancelled:
      case GitHubSignInResultStatus.failed:
        print(result.errorMessage);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Image(
              image: AssetImage('assets/github-logo-vector 1.png'),
              fit: BoxFit.fill,
              width: 220,
              height: 90,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Image(
              image: AssetImage('assets/Group 1000001873.png'),
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.5,
            ),
          ),
          Container(
            child: Text(
              "Lets built from here...",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Our platform drive innovation with tools\nthat boost developer velocity",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {
              _gitHubSignIn(context);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff706CFF),
              ),
              alignment: Alignment.center,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Sign in with Github',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
