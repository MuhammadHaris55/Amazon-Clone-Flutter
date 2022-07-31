import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}

  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     backgroundColor: Colors.transparent,
  //     behavior: SnackBarBehavior.floating,
  //     elevation: 0,
  //     content: Stack(
  //       alignment: Alignment.center,
  //       clipBehavior: Clip.none,
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(8),
  //           height: 70,
  //           decoration: const BoxDecoration(
  //             color: Colors.blue,
  //             borderRadius: BorderRadius.all(Radius.circular(15)),
  //           ),
  //           child: Row(
  //             children: [
  //               const SizedBox(
  //                 width: 48,
  //               ),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: const [
  //                     Text(
  //                       'Oops Error!',
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                     Text(
  //                       // text,
  //                       'This Username is not found! Please try again later',
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         color: Colors.white,
  //                       ),
  //                       maxLines: 2,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Positioned(
  //           bottom: 25,
  //           left: 20,
  //           child: ClipRRect(
  //             child: Stack(
  //               children: [
  //                 Icon(
  //                   Icons.circle,
  //                   color: Colors.red.shade200,
  //                   size: 17,
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           top: -20,
  //           left: 5,
  //           child: Stack(
  //             alignment: Alignment.center,
  //             children: [
  //               Container(
  //                 height: 30,
  //                 width: 30,
  //                 decoration: const BoxDecoration(
  //                   color: Colors.red,
  //                   borderRadius: BorderRadius.all(
  //                     Radius.circular(15),
  //                   ),
  //                 ),
  //               ),
  //               const Positioned(
  //                 top: 5,
  //                 child: Icon(
  //                   Icons.clear_outlined,
  //                   color: Colors.white,
  //                   size: 20,
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
