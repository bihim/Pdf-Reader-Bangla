import 'package:pdf_book_bangla/view/screens/bookmark_screen.dart';
import 'package:pdf_book_bangla/view/screens/downloaded_screen.dart';
import 'package:pdf_book_bangla/view/screens/home_screen.dart';
import 'package:pdf_book_bangla/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class GlobalValues {
  static final pages = [HomeScreen(), BookmarkScreen(), DownloadedScreen(), SettingsScreen()];

  static final gradient1 = [Color(0xFF8E2DE2), Color(0xFF4A00E0)];
  static final gradient2 = [Color(0xFF1f4037), Color(0xFF99f2c8)];
  static final gradient3 = [Color(0xFFf953c6), Color(0xFFb91d73)];
  static final gradient4 = [Color(0xFFf12711), Color(0xFFf5af19)];
  static final gradient5 = [Color(0xFF009FFF), Color(0xFFec2F4B)];
  static final gradient6 = [Color(0xFF654ea3), Color(0xFFeaafc8)];
  static final gradient7 = [Color(0xFFED213A), Color(0xFF93291E)];
  static final gradient8 = [Color(0xFF00B4DB), Color(0xFF0083B0)];
  static final gradient9 = [Color(0xFF636363), Color(0xFFa2ab58)];
  static final gradient10 = [Color(0xFFad5389), Color(0xFF3c1053)];

  static final gradients = [gradient1, gradient2, gradient3, gradient4, gradient5, gradient6, gradient7, gradient8, gradient9, gradient10];

  static final url = "https://pdfbookbangla.000webhostapp.com/api/pdfs";
  static final url2 = "https://pdfbookbangla.000webhostapp.com/api/pdfs/Abonindranath";
  static final urlLocal = "http://192.168.0.105:8000/api/pdfs";

  static final baseUrl = "http://103.81.104.98/DATA/NAS1/E-Books/%e0%a7%ad%e0%a7%a7%e0%a7%a8%20%e0%a6%9f%e0%a6%be%20%e0%a6%ac%e0%a6%be%e0%a6%82%e0%a6%b2%e0%a6%be%20%e0%a6%89%e0%a6%aa%e0%a6%a8%e0%a7%8d%e0%a6%af%e0%a6%be%e0%a6%b8/";
}
