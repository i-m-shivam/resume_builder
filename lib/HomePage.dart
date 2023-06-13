import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_maker/getallcontroller.dart';
import 'package:resume_maker/resume_Page.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  controllerAll allcontroller = Get.put(controllerAll());
  List<TextField> textfil = [];
  List<TextEditingController> _controllers = [];
  var filepath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Resume Maker",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Please Fill Out All Details"),
              Textallfiled("Enter Full Name", allcontroller.nameController),
              Textallfiled("Enter Email", allcontroller.EmailController),
              Textallfiled("Enter Address", allcontroller.addressController),
              Textallfiled("Enter Phone", allcontroller.MobileController),
              Textallfiled(
                  "Enter Education", allcontroller.educationController),
              Textallfiled("Enter univercityName",
                  allcontroller.univercitynameController),
              Textallfiled("Enter passingYear", allcontroller.passingYear),
              ListView.builder(
                itemCount: textfil.length,
                itemBuilder: (BuildContext context, int index) {
                  return Textallfiled(index, _controllers);
                },
              ),
              DropdownButton(
                items: allcontroller.dropdownItems,
                value: allcontroller.selectedvalue,
                onChanged: (String? newValue) {
                  setState(() {
                    allcontroller.selectedvalue = newValue!;
                  });
                },
              ),
              Container(
                child: ElevatedButton(
                  child: Text("Select image"),
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    XFile? file =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (file != null) {
                      setState(() {
                        allcontroller.filepath = file.path;
                      });
                    }
                  },
                ),
              ),
              if (filepath.isNotEmpty) Image.file(File(filepath)),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => resumePage());
                  },
                  child: Text("Generate"))
            ],
          ),
        ));
  }

  Widget Textallfiled(var textoflable, var entercontroller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          controller: entercontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: textoflable,
          )),
    );
  }
}
