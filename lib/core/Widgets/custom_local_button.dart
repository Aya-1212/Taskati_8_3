import 'package:flutter/material.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';

class CustomLocalButtom extends StatelessWidget {
  final String text ;
  final Function() onpressed ;
  final double? width ;
  final double? height;

  const CustomLocalButtom({
    super.key, required this.text, required this.onpressed, this.width, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:(height)?? 60,
      width: (width)??100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            backgroundColor: AppColors.primary,
            padding:const EdgeInsets.all(2),
          ),
          onPressed: onpressed,
          child: Text(
            text,
            style: getSmallFont(context,fontSize: 16,
                colors: AppColors.white, fontWeight: FontWeight.w400),
          )),
    );
  }
}
