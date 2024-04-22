import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati_8_3/core/Functions/routing.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';
import 'package:taskati_8_3/core/services/local_storage.dart';
import 'package:taskati_8_3/features/profile/presentation/view/profile_view.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
     Expanded(
      flex: 3,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             'Hello, ${AppLocalStorage.getUserData('name')}',
             style: getTitleFont(context,),
           ),
           Text('Have A Nice Day.',
               style: getSmallFont(context,
                fontWeight: FontWeight.w400,
               )),
         ],
       ),
     ),
     const Spacer(),
     //image
     Expanded(
       child: InkWell(
        onTap: (){
          pushTo(context, ProfileView());
        },
         child: CircleAvatar(
           radius: 35,
           backgroundImage: FileImage(File(AppLocalStorage.getUserData('image'))) as ImageProvider,
         ),
       ),
     ),
                ],
              );
  }
}
