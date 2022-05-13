import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

import '../../domain/model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewmodel = OnBoardingViewModel();
  _bind(){
    _viewmodel.start();
  }


  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {  //參數會傳入到Builder
    return StreamBuilder<SlideViewObject>(
      stream: _viewmodel.outputSliderViewObject,
      builder: (context,snapShot){
        return _getContentWidget(snapShot.data);
      },
    );
  }


  Widget _getBottomSheetWidget(SlideViewObject sliderViewObject) {
    return Container(
      color:ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrorIc),
              ),
              onTap: () {
                _pageController.animateToPage(_viewmodel.goPrevious(),
                    duration:Duration(microseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
          Row(
            children: [
              for(int i = 0; i < sliderViewObject.numOfSlider; i++)
                Padding(padding: EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i,sliderViewObject.currentIndex),)

            ],
          ),
          Padding(padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrorIc),
              ),
              onTap: () {
                _pageController.animateToPage(_viewmodel.goNext(),
                    duration:Duration(microseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          )
        ],
      ),
    );
  }
  Widget _getProperCircle(int index,int _currentIndex){
    if(index == _currentIndex){
      return SvgPicture.asset(ImageAssets.hollowCircleIc);  //選中
    }else{
      return SvgPicture.asset(ImageAssets.solidcircleIc); //沒被選中
    }
  }

  Widget _getContentWidget(SlideViewObject? slideViewObject){
      if(slideViewObject == null){
        return Container();
      }else {
        return Scaffold(
          backgroundColor: ColorManager.darkPrimary,
          appBar: AppBar(
            backgroundColor: ColorManager.white,
            elevation: AppSize.s0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          body: PageView.builder(
              controller: _pageController,
              itemCount: slideViewObject.numOfSlider,
              onPageChanged: (index) {
                _viewmodel.onPageChange(index);
              },
              itemBuilder: (context, index) {
                return OnBoardingPage(slideViewObject.sliderObject);
              }),
          bottomSheet: Container(
            color: ColorManager.white,
            height: AppSize.s100,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.skip,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                _getBottomSheetWidget(slideViewObject)
              ],
            ),
          ),
        );
      }
  }
  @override
  void dispose() {
    _viewmodel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;

  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}
