import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class TempView extends StatelessWidget {
  static const routeName = '/tempView';

  static const String msg = ''
      'تم تحويل 300.0 جنيه لرقم 01023646610. مصاريف الخدمة 1.0 جنيه. رصيد محفظتك الحالي2.26. استخدم خدمات فودافون كاش و تابع كل مصروفاتك من تاريخ المعاملات على أبلكيشن أنا فودافون http://vf.eg/vfcash';
  static const String msg2 =
      'تم تحويل 300.0 جنية لرقم 01023646610 مصاريف الخدمة 1.0 جنية  . اطلب *9# و \n 0:المزيد';
  const TempView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1A1F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          const Center(
              child: Text('3:37 AM', style: TextStyle(color: Colors.white))),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff302F34)),
            // height: 200,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(
                        left: 25, right: 10, top: 10, bottom: 15),
                    child: const Text(
                      textDirection: TextDirection.rtl,
                      msg,
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Color(0xff1B1A1F),
                  ),
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Tap to load preview',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4,),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text('3:37 AM',style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 13),),
                SizedBox(width: 5,),
                Text('Vodafone',style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff57B4BE),
                    fontSize: 13),),

              ],
            ),
          ),

        ] ,
      ),
    );
  }
}
/*
[
          Container(
            height: 280,
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 70, left: 50),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff242424),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Carrier info',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  msg2,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 15),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.only(left: 50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                      decoration: InputDecoration(border: InputBorder.none)),
                ),
                SizedBox(height: 10,),
                Row( mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(primary: Color(0xff353535)),),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 120,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Send',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                            fontSize: 16),
                          ),
                      style: ElevatedButton.styleFrom(primary: Color(0xff0073DD)),),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ]
 */
/*
[
          const Center(
              child: Text('1:30 PM', style: TextStyle(color: Colors.white))),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff302F34)),
            // height: 200,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(
                        left: 25, right: 10, top: 10, bottom: 15),
                    child: const Text(
                      textDirection: TextDirection.rtl,
                      msg,
                      style: TextStyle(color: Colors.white,fontFamily: 'Roboto'),
                    )),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Color(0xff1B1A1F),
                  ),
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Tap to load preview',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]
 */
