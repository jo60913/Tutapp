import 'package:flutter/material.dart';
import 'package:untitled/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize,String fontFamily,
    FontWeight fontWeight,Color color) {
  return TextStyle(fontSize: fontSize,fontFamily: fontFamily,color: color,fontWeight: fontWeight);
}

//regular style
TextStyle getRegularStyle({double fontSize = FontSize.s12,required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily,FontWeightManager.regular,color);
}

//light text style
TextStyle getLightStyle({double fontSize = FontSize.s12,required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily,FontWeightManager.light,color);
}

//bold text style
TextStyle getBoldStyle({double fontSize = FontSize.s12,required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily,FontWeightManager.bold,color);
}

//SemiBold text style
TextStyle getSemiBoldStyle({double fontSize = FontSize.s12,required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily,FontWeightManager.semibold,color);
}
//Medium text style
TextStyle getMediumStyle({double fontSize = FontSize.s12,required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily,FontWeightManager.medium,color);
}