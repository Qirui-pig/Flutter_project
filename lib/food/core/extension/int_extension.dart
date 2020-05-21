import 'package:pageview_test/food/ui/shared/size_fit.dart';

extension intFit on int{
  double get px {
    return SizeFit.setPx(this.toDouble());
  }
  double get rpx {
    return SizeFit.setRpx(this.toDouble());
  }
}