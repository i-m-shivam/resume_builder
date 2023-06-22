import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/HomePage.dart';
import 'package:resume_maker/getallcontroller.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class resumePage extends StatefulWidget {
  const resumePage({super.key});

  @override
  State<resumePage> createState() => _resumePageState();
}

class _resumePageState extends State<resumePage> {
  ScreenshotController screenshotController = ScreenshotController();
  controllerAll allcontroller = Get.put(controllerAll());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                Get.to(() => Homepage());
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                setState(() {});
                shareImage();
              },
              icon: Icon(Icons.share))
        ]),
        body: Screenshot(
          controller: screenshotController,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      Text(
                        allcontroller.nameController.text.trim(),
                        style: GoogleFonts.robotoSlab(
                            fontSize: 18.sp,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        allcontroller.selectedvalue,
                        style: GoogleFonts.acme(),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage:
                            FileImage(File(allcontroller.filepath)),
                        radius: 50,
                        backgroundColor: Colors.green,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 20.h,
                        width: 40.w,
                        child: Column(
                          children: [
                            detailText(Icons.email,
                                allcontroller.EmailController.text.trim()),
                            detailText(Icons.phone,
                                allcontroller.MobileController.text.trim()),
                            detailText(Icons.location_on,
                                allcontroller.addressController.text.trim()),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 20.h,
                      width: 40.w,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Center(
                              child: Text(
                                "Summury",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                            child: Divider(color: Colors.green),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "To be a dedicated technocrat and serve the company to the best of my ability utilizing all the skills as a Diploma gained during my life.",
                              style: GoogleFonts.acme(fontSize: 8.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Eduaction",
                    style: GoogleFonts.acme(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: allcontroller.degreeName.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        "-> " + allcontroller.degreeName[index].text.trim(),
                        style: GoogleFonts.acme(fontSize: 10.sp),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Experience",
                    style: GoogleFonts.acme(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: allcontroller.controllerfortextfiled.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        "-> " +
                            allcontroller.controllerfortextfiled[index].text
                                .trim(),
                        style: GoogleFonts.acme(fontSize: 10.sp),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Declaration",
                    style: GoogleFonts.acme(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                  child: Divider(),
                ),
                Text(
                    "I do here by conform that the information given in this C. V. is true and correct to the best of my knowledge in case any error or omission is found at later date; I shall be liable for the consequences.",
                    style: GoogleFonts.acme(fontSize: 8.sp)),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        Text(allcontroller.nameController.text.trim(),
                            style: GoogleFonts.acme()),
                        Text(
                            DateFormat("yyyy-MM-dd")
                                .format(DateTime.now())
                                .toString(),
                            style: GoogleFonts.acme())
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget detailText(enter_iconName, var enterText) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Icon(enter_iconName, size: 12.sp),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4),
            child: Text(
              enterText,
              style: GoogleFonts.acme(fontSize: 8.sp),
            ),
          ),
        ],
      ),
    );
  }

  shareImage() async {
    final uint8List = await screenshotController.capture(pixelRatio: 3);
    String tempPath = (await getTemporaryDirectory()).path;
    String fileName = "resume_";

    File file = await File('$tempPath/$fileName.png').create();
    file.writeAsBytesSync(uint8List!);
    await Share.shareXFiles(file.path as List<XFile>);
  }
}
