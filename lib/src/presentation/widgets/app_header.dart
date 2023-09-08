import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppHeader extends StatelessWidget {
  late final String title ;
AppHeader(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return           Container(
      padding: EdgeInsets.only(top: 30.h),
      height: 60.h,
      child:  Text(title,style:const  TextStyle(
        fontFamily: 'Eri',
        fontSize: 30,
        color: Color(0xff102039),
      )),
    );
  }
}
