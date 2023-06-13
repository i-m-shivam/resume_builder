// import 'dart:io';
// import 'dart:typed_data';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:resume_maker/getallcontroller.dart';
// import 'package:sizer/sizer.dart';
// import 'package:get/get.dart';

// Future screenToPdf(
//   String fileName,
// ) async {
//   Document pdf = Document();
//   pdf.addPage(
//     Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (context) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(children: [
//                   Text(
//                     "allcontroller.nameController.text.trim()",
//                     style: TextStyle(
//                         fontSize: 18.sp,
//                         color: PdfColor.fromInt(0xff000000),
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     allcontroller.selectedvalue,
//                   ),
//                 ]),
//                 // Padding(
//                 // padding: const EdgeInsets.all(8.0),
//                 // child: ClipRRect(
//                 //   child: Image(MemoryImage(bytes))),
//                 // ),
//                 // )
//               ],
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: 50.h,
//                     width: 40.w,
//                     child: Column(
//                       children: [
//                         detailText(Icons.email,
//                             allcontroller.EmailController.text.trim()),
//                         detailText(Icons.phone,
//                             allcontroller.MobileController.text.trim()),
//                         detailText(Icons.location_on,
//                             allcontroller.addressController.text.trim()),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 50.h,
//                   width: 40.w,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Center(
//                           child: Text(
//                             "Experience",
//                             style: TextStyle(
//                                 fontSize: 14.sp, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 25.w,
//                         child: Divider(color: Colors.green),
//                       ),
//                       Text(allcontroller.nameController.text.trim() +
//                           " from" +
//                           allcontroller.addressController.text.trim() +
//                           ". He has Earn Degree From The " +
//                           allcontroller.univercitynameController.text.trim() +
//                           " at " +
//                           allcontroller.passingYear.text.trim() +
//                           " i work hard ")
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     ),
//   );
//   String path = (await getTemporaryDirectory()).path;
//   File pdfFile = await File('$path/$fileName.pdf').create();

//   pdfFile.writeAsBytesSync(await pdf.save());
//   await Share.shareFiles([pdfFile.path]);
// }

