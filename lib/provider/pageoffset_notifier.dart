import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset;
  double _page;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      print('called');
      _offset = pageController.offset;
      _page = pageController.page;
      notifyListeners();
    });
  }

  double get offset => _offset ?? 0.0;
  double get page => _page;
}
