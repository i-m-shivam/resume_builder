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

  // List<TextEditingController> controllerfortextfiled = [
  //   TextEditingController()
  // ];

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
              ListView.builder(
                itemCount: allcontroller.controllerforeducation.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: allcontroller.controllerforeducation[index],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:
                                'Enter Eduation With Passing year and univercity $index',
                            prefix: IconButton(
                                onPressed: () {
                                  setState(() {});
                                  allcontroller.controllerforeducation
                                      .add(TextEditingController());
                                },
                                icon: Icon(Icons.add)),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {});
                                allcontroller.controllerforeducation
                                    .removeAt(index);
                              },
                            ))),
                  );
                },
              ),
              ListView.builder(
                itemCount: allcontroller.controllerfortextfiled.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: allcontroller.controllerfortextfiled[index],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Experience $index',
                            prefix: IconButton(
                              onPressed: () {
                                setState(() {});

                                allcontroller.controllerfortextfiled
                                    .add(TextEditingController());
                              },
                              icon: Icon(Icons.add),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {});
                                allcontroller.controllerfortextfiled
                                    .removeAt(index);
                              },
                            ))),
                  );
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
              if (allcontroller.filepath.isNotEmpty)
                Image.file(File(allcontroller.filepath)),
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
