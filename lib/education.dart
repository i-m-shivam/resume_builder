import 'package:flutter/material.dart';
import 'package:resume_maker/getallcontroller.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:resume_maker/resume_Page.dart';
import 'package:sizer/sizer.dart';

class educationPage extends StatefulWidget {
  const educationPage({super.key});

  @override
  State<educationPage> createState() => _educationPageState();
}

class _educationPageState extends State<educationPage> {
  controllerAll allcontroller = Get.put(controllerAll());
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
          children: [
            ListView.builder(
              itemCount: allcontroller.degreeName.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                          controller: allcontroller.degreeName[index],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter your Education $index',
                              suffixIcon: allcontroller.degreeName.length == 1
                                  ? null
                                  : IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {});
                                        allcontroller.degreeName
                                            .removeAt(index);
                                      },
                                    ))),
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                setState(() {});
                allcontroller.degreeName.add(TextEditingController());
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
                          labelText: 'Enter Work Experience $index',
                          suffixIcon:
                              allcontroller.controllerfortextfiled.length == 1
                                  ? null
                                  : IconButton(
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
            ElevatedButton(
                onPressed: () {
                  setState(() {});

                  allcontroller.controllerfortextfiled
                      .add(TextEditingController());
                },
                child: Text("Add")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Current Role :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5.w,
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
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => resumePage());
                },
                child: Text("Generate"))
          ],
        ),
      ),
    );
  }
}
