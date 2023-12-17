import 'package:flutter/material.dart';
import 'package:github_ui/Modules/github_project_response.dart';

import '../ApiServices/api_services.dart';
import '../Modules/branches_response.dart';
import '../Utils/util.dart';

class ProjectPage extends StatefulWidget {
  String? unAndPn;
  String? projectName;
  String? userName;
  String? imageUrl;
  String? lastUpdate;

  ProjectPage({
    this.unAndPn,
    this.projectName,
    this.userName,
    this.imageUrl,
    this.lastUpdate,
  });

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Files>? files = [];
  Commits? commit;
  List<Branches>? branchList = [];
  List<String>? activeBranch = [];
  bool? loader = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.unAndPn);
    getBranch(widget.unAndPn);
    // getCommits(widget.unAndPn);
  }

  getBranch(unAndPn) {
    AuthService().getProjectBranch(unAndPn).then((value) {
      print("get branch values:");
      print(value);
      branchList = value;
      for (int i = 0; i < branchList!.length; i++) {
        activeBranch!.add("0");
      }
      if (branchList!.length > 0) {
        getCommits(branchList![0].commit!.url);
        activeBranch![0] = "1";
      } else {
        loader = false;
        files = [];
        setState(() {});
      }
      setState(() {});
    });
  }

  getCommits(url) {
    loader = true;
    files = [];
    setState(() {});
    AuthService().getProjectDetails(url).then((value) {
      loader = false;
      print("user values:");
      print(value);
      files = value!.files!;
      commit = value.commit;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Project",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Util.themeColor,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_rounded),
        ),
      ),
      body: Stack(
        children: [
          branchList!.length == 0
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: Text(
                    "No Data",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      color: Util.themeColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(0),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            NetworkImage('${widget.imageUrl}'),
                                        fit: BoxFit.fill,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.projectName}',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${widget.userName}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Last update : ${widget.lastUpdate}",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: branchList!.length,
                          itemBuilder: (context, index) {
                            var list = branchList![index];
                            return InkWell(
                              onTap: () {
                                for (int i = 0; i < branchList!.length; i++) {
                                  if (index == i) {
                                    activeBranch![index] = "1";
                                  } else {
                                    activeBranch![i] = "0";
                                  }
                                }
                                setState(() {
                                  getCommits(list.commit!.url);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: activeBranch![index] == "1"
                                        ? Colors.deepPurpleAccent
                                        : Util.themeColor.withOpacity(0.25),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "${list.name}",
                                  style: TextStyle(
                                    color: activeBranch![index] == "1"
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: files!.length,
                          itemBuilder: (context, index) {
                            var list = files![index];
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 7),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/Frame 1686552913 (2).png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${list.filename!}',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '${commit!.committer!.date}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 65),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/Group 1000001855.png'),
                                        height: 15,
                                        width: 15,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      '${commit!.author!.name!}',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                              ],
                            );
                          }),
                    ),
                  ]),
                ),
          loader == true ? loaderWidget() : Container()
        ],
      ),
    );
  }
}
