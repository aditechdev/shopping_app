import 'dart:io';
// import 'package:file_picker/file_picker.dart' as filePicker;
import 'package:file_picker/file_picker.dart' ;
import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      if (files.isNotEmpty) {
        images.addAll(files);
      }
    } else {
      // User canceled the picker
    }
// FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       File file = File(result.files.single.path);
//     } else {
//       // User canceled the picker
//     }
    // var files = await filePicker.PlatformFile.
    // var files = await FilePicker.platform
    //     .pickFiles(type: FileType.image, allowMultiple: true);
    // if (files != null && files.files.isNotEmpty) {
    //   for (int i = 0; i < files.files.length; i++) {
    //     images.add(File(files.files[i].path!));
    //   }
    // }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
