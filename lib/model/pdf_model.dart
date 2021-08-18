// To parse this JSON data, do
//
//     final pdfModel = pdfModelFromJson(jsonString);

import 'dart:convert';

PdfModel pdfModelFromJson(String str) => PdfModel.fromJson(json.decode(str));

String pdfModelToJson(PdfModel data) => json.encode(data.toJson());

class PdfModel {
  PdfModel({
    required this.data,
  });

  List<Datum> data;

  factory PdfModel.fromJson(Map<String, dynamic> json) => PdfModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.pdfName,
    required this.pdfUrl,
  });

  String pdfName;
  String pdfUrl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    pdfName: json["pdf_name"],
    pdfUrl: json["pdf_url"],
  );

  Map<String, dynamic> toJson() => {
    "pdf_name": pdfName,
    "pdf_url": pdfUrl,
  };
}
