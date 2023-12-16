import 'package:flutter/material.dart';
import 'package:github_ui/ApiServices/api_services.dart';
import 'package:github_ui/UI/project_page.dart';
import 'package:github_ui/Utils/util.dart';

import '../Modules/github_repo_response.dart';
import '../Modules/github_user_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userName="";
  String? userFullName="";
  String? userImage="";
  GithubUserResponse? gGithubUserResponse;
  List<UserResponse>? gGithubRepoResponse=[];
  bool? loader=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getToken();
    getUser();
    getRepoList();
  }

  getToken() async {
    var token= await getAccessToken();
    print("access token"+token.toString());
  }

  getUser(){
    AuthService().getUsers().then((value) {
          print("user values:");
          print(value);
          gGithubUserResponse=value;
          // print(gGithubRepoResponse!.toJson());
          print(gGithubRepoResponse!.length);
          setState(() {
            userFullName=gGithubUserResponse!.name!;
            userName=gGithubUserResponse!.login;
            userImage=gGithubUserResponse!.avatarUrl;
            // loader=false;
          });
    });
  }
  getRepoList(){
    AuthService().getRepo().then((value) {
          print("user values:");
          print(value);
          gGithubRepoResponse=value;
          setState(() {
            loader=false;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github",style: TextStyle(color: Colors.white),),
        backgroundColor: Util.themeColor,
        iconTheme: IconThemeData(color: Colors.white),
actions: [
  IconButton(onPressed: (){
    getRepoList();
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProjectPage()));
  }, icon:Container(
    child:Image(
      image: AssetImage(
          'assets/notifiaction icon.png'),
      fit: BoxFit.fill,
    ),
  ), ),
],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  userImage!=""?Image(
                    image: NetworkImage(
                        '$userImage'),
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ): Image(
                    image: AssetImage(
                        'assets/Mask group.png'),
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$userFullName',
                        style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFF9C37),
                        ),
                        alignment: Alignment.center,
                        height: 25,
                        // width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child:Text('$userName',
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),
                          textAlign: TextAlign.center,),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            ListTile(
              leading: Image(
                image: AssetImage(
                    'assets/log-in.png'),
                fit: BoxFit.fill,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            color: Util.themeColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi $userFullName",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Card(
                    // elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 10,top: 10,bottom: 30),
                      child: Row(
                        children: [
                          userImage!=""?Image(
                            image: NetworkImage(
                                '$userImage'),
                            height: 60,
                            width: 60,
                            fit: BoxFit.fill,
                          ): Image(
                            image: AssetImage(
                                'assets/Mask group.png'),
                            height: 60,
                            width: 60,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$userFullName',
                                style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffFF9C37),
                                ),
                                alignment: Alignment.center,
                                height: 25,
                                // width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child:Text('$userName',
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),
                                  textAlign: TextAlign.center,),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Projects',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black)
                  ),
                  SizedBox(height: 10),
    ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: gGithubRepoResponse!.length,
    itemBuilder: (context, index) {
      var list=gGithubRepoResponse![index];
      return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProjectPage()));
        },
        child: Card(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
          ), color: Colors.white,
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: NetworkImage(
                        '${list.owner!.avatarUrl}'),
                    height: 60,
                    width: 60,
                    fit: BoxFit.fill,
                  ),
                  // Image(
                  //   image: AssetImage(
                  //       'assets/Mask group (1).png'),
                  //   fit: BoxFit.fill,
                  // ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${list.name}',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      Text('${list.fullName}',
                        style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
          ),
        ),
      );
    }),

                ],
              ),
            ),
          ),
          loader==true?loaderWidget():Container()
        ],
      ),
    );
  }
}
