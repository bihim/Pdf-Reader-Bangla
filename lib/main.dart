import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_book_bangla/bind/main_bind.dart';
import 'package:pdf_book_bangla/view/main_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Raleway'
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => MainScreen(), binding: MainBind()),
        ],
      );
    });
  }
}
