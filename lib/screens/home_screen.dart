import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/controllers/home_controller.dart';
import 'package:flutter_boilerplate/helpers/custom_colors.dart';
import 'package:flutter_boilerplate/models/post.dart';
import 'package:flutter_boilerplate/widgets/drawer_navigation.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.colorMain,
        elevation: 0.0,
        title: Text("Posts"),
        titleTextStyle: TextStyle(fontSize: 15.0),
      ),
      drawer: DrawerNavigation(),
      body: Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.postsList.length,
            itemBuilder: (context, index) {
              return _buildPostSingleItem(
                  controller.postsList.elementAt(index));
            },
          )),
    );
  }

  Widget _buildPostSingleItem(Post post) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 10.0,
      child: Row(
        children: [
          Flexible(
              flex: 9,
              child: Column(
                children: [
                  Text("Id: ${post.id}"),
                  Container(
                    height: 2.0,
                    color: Colors.black87,
                  ),
                  Text("Title: ${post.title}"),
                  Container(
                    height: 2.0,
                    color: Colors.black87,
                  ),
                  Text("Body: ${post.body}"),
                  Container(
                    height: 2.0,
                    color: Colors.black87,
                  ),
                  Text("User Id: ${post.userId}"),
                  Container(
                    height: 2.0,
                    color: Colors.black87,
                  ),
                ],
              )),
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    tooltip: "Edit",
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    tooltip: "Delete",
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
