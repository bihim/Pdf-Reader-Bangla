import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_book_bangla/controller/main_controller.dart';
import 'package:pdf_book_bangla/global/global_values.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreen extends StatelessWidget {
  MainController _mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: IndexedStack(
            children: GlobalValues.pages,
            index: _mainController.bottomIndex.value,
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: _toolbarText(_mainController.bottomIndex.value),
          ),
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: SalomonBottomBar(
          margin: EdgeInsets.all(2.h),
          onTap: (index) {
            _mainController.bottomIndex.value = index;
          },
          unselectedItemColor: Colors.grey,
          currentIndex: _mainController.bottomIndex.value,
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home_rounded),
              title: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Raleway',
                ),
              ),
              selectedColor: Colors.deepPurple.shade600,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.bookmark_rounded),
              title: Text(
                'Bookmark',
                style: TextStyle(
                  fontFamily: 'Raleway',
                ),
              ),
              selectedColor: Colors.green,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.download_rounded),
              title: Text(
                'Download',
                style: TextStyle(
                  fontFamily: 'Raleway',
                ),
              ),
              selectedColor: Colors.amber,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.settings_rounded),
              title: Text(
                'Setting',
                style: TextStyle(
                  fontFamily: 'Raleway',
                ),
              ),
              selectedColor: Colors.redAccent,
            ),
          ],
        ),
      );
    });
  }

  Text _toolbarText(int index) {
    if (index == 1) {
      return Text(
        'Bookmark',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 2) {
      return Text(
        'Download',
        style: TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 3) {
      return Text(
        'Settings',
        style: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        'Reading Zone',
        style: TextStyle(
          color: Colors.deepPurple.shade600,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}
