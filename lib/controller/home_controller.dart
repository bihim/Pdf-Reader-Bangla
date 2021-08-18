import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_book_bangla/global/global_values.dart';
import 'package:pdf_book_bangla/model/pdf_model.dart';

class HomeController extends GetxController {

  var client = http.Client();

  Future<PdfModel?> fetchPdfs() async {
    var response = await client.get(Uri.parse(GlobalValues.urlLocal));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode==200) {
      var jsonBody = response.body;
      return pdfModelFromJson(jsonBody);
    }
    else{
      print(response.body);
    }
  }
}
