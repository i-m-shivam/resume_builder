import 'package:flutter/material.dart';
import 'package:get/get.dart';

class controllerAll extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String filepath = "";
  List<TextEditingController> controllerfortextfiled = [
    TextEditingController()
  ];
  List<TextEditingController> collegeName = [TextEditingController()];
  List<TextEditingController> degreeName = [TextEditingController()];
  List<TextEditingController> univercityName = [TextEditingController()];
  List<TextEditingController> passingYear = [TextEditingController()];

  var selectedvalue = 'Flutter Developer';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("Flutter Developer"), value: "Flutter Developer"),
      DropdownMenuItem(child: Text("node js"), value: "node js"),
      DropdownMenuItem(child: Text("anguler"), value: "anguler"),
      DropdownMenuItem(child: Text(".net Devloper"), value: ".net Devloper"),
    ];
    return menuItems;
  }
}
