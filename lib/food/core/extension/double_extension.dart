import 'package:pageview_test/food/ui/shared/size_fit.dart';



extension doubleFit on double{
  double get px {
    return SizeFit.setPx(this);
  }
  double get rpx {
    return SizeFit.setRpx(this);
  }
}