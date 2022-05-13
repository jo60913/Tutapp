import 'dart:async';

import 'package:untitled/domain/model.dart';
import 'package:untitled/presentation/base/baseviewmodel.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends
BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  final StreamController _streamController = StreamController<SlideViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  //輸入
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    //傳送slider給view
    _postDataToView();
  }

  @override
    int goNext() {
    int nextindex = _currentIndex++;
    if(nextindex>=_list.length){  //按到最後一個的時後再回到第一個
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousindex = _currentIndex--;
    if(previousindex==-1){ //按到第一個的時後再回到最後一個
      _currentIndex = _list.length -1;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  void onPageChange(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink; //代表要初始化這個sink

  @override //使用sink之後slideViewObject對象並使用map方法就可以做一些操作來當作這個方法的回傳。等於這個方法在接收資料做轉換後再回傳
  Stream<SlideViewObject> get outputSliderViewObject => _streamController.stream.map((slideViewObject) => slideViewObject);

  List<SliderObject> _getSliderData() =>
      [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onbardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onbardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onbardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onbardingLogo4),
      ];

  _postDataToView(){
    inputSliderViewObject.add(SlideViewObject(_list[_currentIndex],_list.length,_currentIndex));
  }

}
//輸入代表從view接收到指令 input使用sink
abstract class OnBoardingViewModelInput {
  void goNext(); //當使用者按下右邊箭頭或滑向下一頁
  void goPrevious(); //按下左頁與滑向上一頁
  void onPageChange(int index); //

  Sink get inputSliderViewObject; //把資料給stream的方法 stream的input
}

//將從ViewModel的資料傳到view output使用stream
abstract class OnBoardingViewModelOutput {
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlider;
  int currentIndex;

  SlideViewObject(this.sliderObject, this.numOfSlider, this.currentIndex);

}