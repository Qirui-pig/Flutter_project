import 'dart:ui';

class SizeFit{
  static double physicalWidth;
  static double physicalHeight;
  static double screenWidth;
  static double screenHeight;
  static double dpr;
  static double statusHeight;

  static double rpx;
  static double px;



  static void initialize({double standardSize = 750}){

    physicalHeight = window.physicalSize.height;
    physicalWidth = window.physicalSize.width;

    dpr = window.devicePixelRatio;

    screenHeight = physicalHeight / dpr;
    screenWidth = physicalWidth / dpr;

    statusHeight = window.padding.top / dpr;

    rpx = screenWidth / standardSize;

    px = screenWidth / standardSize * 2;


  }

  static double setRpx (double size){
    print(rpx);
//    return rpx * size;
  }

  static double setPx (double size){
    return px * size;
  }



}