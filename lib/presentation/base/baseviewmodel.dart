abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutput{
  //所有變數與方法都會透過viewmode的函數
}

abstract class BaseViewModelInputs{
  void start(); //當viewModel初始化時呼叫
  void dispose(); //當viewMdoel結束時呼叫
}

abstract class BaseViewModelOutput{

}