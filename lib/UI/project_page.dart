import 'package:flutter/material.dart';

import '../Utils/util.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Project",style: TextStyle(color: Colors.white),),
        backgroundColor: Util.themeColor,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_rounded),
        ),
      ),
      body: Column(
        children: [
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
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                    ),
                    child: Image(
                      image: AssetImage(
                          'assets/Mask group (1).png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Heavenly',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      Text('Rajesh kannan',
                        style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Text(
              "Last update : 24/04/2023 9.30am",
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white),
            ),
          ],
        ),
      ),
          Container(
            child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 1,
    itemBuilder: (context, index) {
      return Container();

    }),
          ),
          Container(
            child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (context, index) {
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
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login flow',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    Text('17/05/23 09:30AM',
                      style: TextStyle(fontSize: 12,
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                ),
                child: Image(
                  image: AssetImage(
                      'assets/Group 1000001855.png'),
                  height: 15,
                  width: 15,
                  fit: BoxFit.fill,
                ),
              ),
              Text('Pravin Kumar',
                style: TextStyle(fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ],
          ),
        ],
      );

    }),
          ),


        ]
      ),
    );
  }
}
