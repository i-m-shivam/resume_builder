import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker/getallcontroller.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';

import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';

controllerAll allcontroller = Get.put(controllerAll());

class resumePage extends StatefulWidget {
  const resumePage({super.key});

  @override
  State<resumePage> createState() => _resumePageState();
}

class _resumePageState extends State<resumePage> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
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
                        height: 50.h,
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
                      height: 50.h,
                      width: 40.w,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Center(
                              child: Text(
                                "Experience",
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
                          Text(
                            allcontroller.nameController.text.trim() +
                                " from" +
                                allcontroller.addressController.text.trim() +
                                ". He has Earn Degree From The " +
                                allcontroller.univercitynameController.text
                                    .trim() +
                                " at " +
                                allcontroller.passingYear.text.trim() +
                                " i work hard ",
                            style: GoogleFonts.acme(fontSize: 8.sp),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      shareImage();
                    },
                    child: Text("save to pdf"))
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
            padding: const EdgeInsets.all(8.0),
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
    final uint8List = await screenshotController.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    String fileName = "myFile";
    if (await Permission.storage.request().isGranted ||
        await Permission.storage.request().isDenied) {
      File file = await File('$tempPath/$fileName.png').create();
      file.writeAsBytesSync(uint8List!);
      await Share.shareFiles([file.path]);
    }
  }
}
