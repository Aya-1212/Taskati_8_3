import 'package:flutter/material.dart';
import 'package:taskati_8_3/core/Utils/app_colors.dart';
import 'package:taskati_8_3/core/Utils/text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Function() onpressed;
  
  const CustomElevatedButton({
    super.key,
    required this.text,
     this.width,
     this.height,
    required this.onpressed,
    
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:(height) ?? 50,
      width: (width) ?? 250,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
        child: Text(
          text,
          style: getSmallFont(colors: AppColors.white),
        ),
      ),
    );
  }
}