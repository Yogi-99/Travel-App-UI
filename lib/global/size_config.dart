import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static double screenHeight;
  static double screenWidth;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  static double thirtyTwoSize = (SizeConfig.textMultiplier * 4.705);
  static double thirtySize = (SizeConfig.textMultiplier * 4.392);
  static double fourteenSize = (SizeConfig.textMultiplier * 2.05);
  static double fifeteenSize = SizeConfig.textMultiplier * 2.2;
  static double sixteenSize = SizeConfig.textMultiplier * 2.342;
  static double eighteenSize = SizeConfig.textMultiplier * 2.635;
  static double twentySize = SizeConfig.textMultiplier * 2.928;
  static double twelveSize = SizeConfig.textMultiplier * 1.756;
  static double thirteenSize = SizeConfig.textMultiplier * 1.911;

  static void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      screenHeight = _screenHeight;
      screenWidth = _screenWidth;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    if (_screenHeight > 730) {
      textMultiplier = _blockHeight * 0.8;
    } else {
      textMultiplier = _blockHeight;
    }

    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    // block width: 4.11px
    // block height: 6.83px
  }
}
