import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pdf_book_bangla/controller/home_controller.dart';
import 'package:pdf_book_bangla/global/global_values.dart';
import 'package:pdf_book_bangla/model/pdf_model.dart';
import 'package:pdf_book_bangla/view/pdf/pdf_view_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  final sampleUrlPdf =
      "http://103.81.104.98/DATA/NAS1/E-Books/%E0%A7%AD%E0%A7%A7%E0%A7%A8%20%E0%A6%9F%E0%A6%BE%20%E0%A6%AC%E0%A6%BE%E0%A6%82%E0%A6%B2%E0%A6%BE%20%E0%A6%89%E0%A6%AA%E0%A6%A8%E0%A7%8D%E0%A6%AF%E0%A6%BE%E0%A6%B8/1971-by-Humayum-Ahmed.PDF";
  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Center(
              child: SvgPicture.asset(
                'assets/home_read.svg',
                height: 25.h,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          FutureBuilder<PdfModel?>(
            future: _homeController.fetchPdfs(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return _gridMethod(snapshot.data, index);
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Widget _gridMethod(PdfModel? pdfModel, int index) {
    final _random = new Random();
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, -4.0),
            end: Alignment(1.0, 4.0),
            colors: GlobalValues.gradients[_random.nextInt(GlobalValues.gradients.length)],
          ),
          borderRadius: BorderRadius.circular(4.h),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(4.h),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Text(
                        pdfModel!.data[index].pdfName,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, height: 0.3.h),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -3.h,
                  top: -3.h,
                  child: Container(
                    width: 27.w,
                    height: 15.h,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0.5.h,
                          top: 2.5.h,
                          child: Container(
                            width: 20.w,
                            height: 10.h,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0x20FFFFFF)),
                          ),
                        ),
                        Positioned(
                          right: -2.h,
                          child: Container(
                            width: 30.w,
                            height: 15.h,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0x20FFFFFF)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              Get.to(()=>PdfViewScreen(url: GlobalValues.baseUrl+pdfModel.data[index].pdfUrl));
            },
          ),
        ),
      ),
    );
  }
}

/*
* PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        defaultPage: 12,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onPageChanged: (int page, int total) {
          print('page change: $page/$total');
        },
      ).cachedFromUrl(
        sampleUrlPdf,
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => Center(child: Text(error.toString())),
      ),*/
