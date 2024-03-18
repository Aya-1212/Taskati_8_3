// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_8_3/core/Constants/assets_icons.dart';
import 'package:taskati_8_3/core/Functions/routing.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';
import 'package:taskati_8_3/features/Home_screen/widgets/custom_elev_button.dart';
import 'package:taskati_8_3/features/Home_screen/widgets/snack_error.dart';
import 'package:taskati_8_3/features/Main_Screen/View/main_view.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('user');
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            actions: [
              TextButton(
                  onPressed: () {
                    if (path != null && name.isNotEmpty) {
                      box.put('name', name);
                      box.put('image', path);
                      box.put('isUpload', true);
                      pushWithReplacement(context, MainView());
                      
                    } else if (path != null && name.isEmpty) {
                      showSnackeBar(context, 'please enter your name');
                    } else if (path == null && name.isNotEmpty) {
                      showSnackeBar(context, 'please enter your image');
                    } else {
                      showSnackeBar(
                          context, 'please enter your name and image');
                    }
                  },
                  child: Text(
                    'Done',
                    style: getSmallFont(colors: AppColors.primary),
                  ))
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //circleavatar
            CircleAvatar(
              radius: 75,
              backgroundImage: (path != null)
                  ? FileImage(File(path!)) as ImageProvider
                  : AssetImage(AssetsIcons.user),
            ),
            SizedBox(
              height: 10,
            ),
            // 2 custom elevatedbutton
            customElevatedButton(
              onpressed: () {
                uploadImage(isCamera: true);
              },
              text: 'Upload from camera',
            ),
            SizedBox(
              height: 10,
            ),
            customElevatedButton(
                text: 'Upload from gallery',
                onpressed: () {
                  uploadImage(isCamera: false);
                }),
            SizedBox(height: 10),
            Divider(),
            SizedBox(
              height: 10,
            ),
            //text form field
            TextFormField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Enter your Name', hintStyle: getSmallFont()),
            ),
          ],
        )),
      ),
    );
  }

  String? path;

  uploadImage({required bool isCamera}) async {
    final pickedImage = await ImagePicker().pickImage(
        source: (isCamera) ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
