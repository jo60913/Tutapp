//把網頁下載的映射成對象
import 'package:untitled/app/constant.dart';
import 'package:untitled/app/extensions.dart';
import 'package:untitled/data/responses/responses.dart';

import 'package:untitled/domain/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse?{
  Customer toDomain(){
    return Customer(this?.id?.orEmpty() ?? EMPTY,this?.name?.orEmpty() ?? EMPTY,this?.numOfNotifitcation?.orZero() ?? ZERO);
  }
}

extension ConstactsResponseMapper on ConstactsResponse?{
  Contacts toDomain(){
    return Contacts(this?.email?.orEmpty() ?? EMPTY,this?.phone?.orEmpty() ?? EMPTY,this?.link?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication(this?.customer?.toDomain(),this?.constacts?.toDomain());
  }
}