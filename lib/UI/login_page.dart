import 'package:flutter/material.dart';
import 'package:github_ui/UI/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              image: AssetImage(
                  'assets/github-logo-vector 1.png'),
              fit: BoxFit.fill,
              width: 220,
              height: 90,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(
                  'assets/Group 1000001873.png'),
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width/1.5,
              height: MediaQuery.of(context).size.width/1.5,
            ),
          ),
          Container(
            child: Text(
              "Lets built from here...",
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Our platform drive innovation with tools\nthat boost developer velocity",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                 color: Color(0xff706CFF),
              ),
              alignment: Alignment.center,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child:Text('Sign in with Github',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                textAlign: TextAlign.center,),
              /*child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff706CFF),
                  foregroundColor: Colors.white,

                ),
                child: Text('Sign in with Github'),
                onPressed: (){

                },
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}
