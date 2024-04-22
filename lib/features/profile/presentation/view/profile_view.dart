// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_8_3/core/Constants/assets_icons.dart';
import 'package:taskati_8_3/core/Functions/routing.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';
import 'package:taskati_8_3/core/Widgets/custom_local_button.dart';
import 'package:taskati_8_3/core/services/local_storage.dart';

class ProfileView extends StatefulWidget {
  ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

   uploadImage({required bool isCamera}) async {
    final pickedImage = await ImagePicker().pickImage(
        source: (isCamera) ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      AppLocalStorage.cacheUserData('image',pickedImage.path);
    }
  }

  var nameController = TextEditingController(text: AppLocalStorage.getUserData('name')); 
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isDark = AppLocalStorage.getUserData('isDark') ?? false;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
                AppLocalStorage.cacheUserData('isDark', isDark);
              },
              icon: Icon(isDark ? Icons.sunny : Icons.nightlight_round),
            ),
          ],
        ),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: Hive.box('user').listenable(),
          builder: (context, box, child) {
            String path = box.get('image') ?? '';
            String name = box.get('name') ?? '';
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: (path.isNotEmpty)
                            ? FileImage(File(path)) as ImageProvider
                            : AssetImage(AssetsIcons.user),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomLocalButtom(
                                        height: 60,
                                        width: double.infinity,
                                          text: 'Upload from camera',
                                          onpressed: () {
                                              uploadImage(isCamera: true);
                                              popFrom(context,);
                                          }),
                                      Gap(20),
                                      CustomLocalButtom(
                                         height: 60,
                                        width: double.infinity,
                                          text: 'Upload from gallery',
                                          onpressed: () {
                                             uploadImage(isCamera: false);
                                              popFrom(context,);
                                          })
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.white,
                            foregroundColor: AppColors.primary,
                            radius: 20,
                            child: const Icon(Icons.camera_alt_rounded),
                          ),
                        ),
                      )
                    ],
                  ),
                  //______end stack_________
                  const Gap(30),
                  Divider(
                    color: AppColors.primary,
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        name,
                        style: getTitleFont(
                          context,
                        ),
                      )),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: MediaQuery.of(context).viewInsets,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  child: Form(
                                    key: formKey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          
                                         TextFormField(controller: nameController,validator: (value) {
                                           if( value!.isEmpty){
                                            return 'Please Enter Your Name';
                                           }
                                           return null;
                                         },),
                                          Gap(20),
                                          CustomLocalButtom(
                                             height: 60,
                                            width: double.infinity,
                                              text: 'Update Name',
                                              onpressed: () {
                                                if(formKey.currentState!.validate()){
                                                 AppLocalStorage.cacheUserData('name', nameController.text);
                                                 popFrom(context); 
                                                }
                                            
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                        },
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.primary,
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: AppColors.white,
                            foregroundColor: AppColors.primary,
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
