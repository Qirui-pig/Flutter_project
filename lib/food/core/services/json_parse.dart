import 'dart:convert';
import 'package:pageview_test/food/core/model/cate_model.dart';
import 'package:flutter/services.dart';

class JsonParse{
  static Future<List<CateModel>> getCateData() async{
    final jsonString = await rootBundle.loadString('assets/json/category.json');

    final res = json.decode(jsonString);


    final resultList = res['category'];

    List<CateModel> categories = [];

    for(var json in resultList){
      categories.add(CateModel.fromJson(json));
    }
//    print(categories);
    return categories;
  }
  
  
}