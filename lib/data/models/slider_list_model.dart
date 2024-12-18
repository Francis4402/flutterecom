import 'package:ecommerceflutter/data/models/slider_data.dart';

class BookListModel {
  String? message;
  bool? success;
  List<BookData>? sliderList;

  BookListModel({this.message, this.success, this.sliderList});

  BookListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      sliderList = List<BookData>.from(
        json['data'].map((item) => BookData.fromJson(item)),
      );
    }
  }
}
