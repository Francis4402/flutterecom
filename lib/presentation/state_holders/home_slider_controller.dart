import 'package:ecommerceflutter/data/models/network_response.dart';
import 'package:ecommerceflutter/data/models/slider_data.dart';
import 'package:ecommerceflutter/data/models/slider_list_model.dart';
import 'package:ecommerceflutter/data/network_caller/network_caller.dart';
import 'package:ecommerceflutter/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<BookData> _sliderList = [];

  bool get inProgress => _inProgress;
  List<BookData> get sliderList => _sliderList;
  String get errorMessage => _errorMessage;

  Future<bool> getSliders() async {
    _inProgress = true;
    _errorMessage = '';
    update();

    try {
      final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.homeSlider);

      if (response.isSuccess) {
        _sliderList = BookListModel.fromJson(response.responseData).sliderList ?? [];
        _errorMessage = '';
        update();
        return true;
      } else {
        _errorMessage = response.errorMessage ?? 'An unknown error occurred.';
        update();
        return false;
      }
    } catch (e) {
      _errorMessage = 'Something went wrong: $e';
      update();
      return false;
    } finally {
      _inProgress = false;
      update();
    }
  }
}