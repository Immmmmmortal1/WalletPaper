import 'dart:io';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_paper_main/dio_service/app_service.dart';
import 'package:wallet_paper_main/model/category_model.dart';
import 'package:wallet_paper_main/model/paper_item_model.dart';

class DataProvider with ChangeNotifier {
  // late SharedPreferences _preferences;

//:分类接口
  String ca_url =
      'http://cdn.apc.360.cn/index.php?c=WallPaper&a=getAllCategoriesV2&from=360chrome';
  //:根据分类获取图片链接
  //http://wallpaper.apc.360.cn/index.php?  c=WallPaper&a=getAppsByCategory  &cid=【刚才获取到的分类ID】  &start=【从第几幅图开始(用于分页)】  &count=【每次加载的数量】&from=360chrome
  // http://p15.qhimg.com/bdr/__85/t0151ad4ac41239cb58.jpg  缩略图
  // http://p19.qhimg.com/bdm/1024_768_80/t0151ad4ac41239cb58.jpg  原图

  DataProvider() {
    // initPrefer();
  }
  // Future<void> initPrefer () async {
  //     // _preferences = await SharedPreferences.getInstance();
  // }

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    String? localData = _preferences.getString('categories');
    if (localData != null) {
      List<dynamic> jsonArray = jsonDecode(localData);
      categories = jsonArray.map((e) => CategoryModel.fromJson(e)).toList();
      notifyListeners();
      return categories;
    } else {
      final categoryR = await ApiService.get(ca_url);
      if (categoryR.statusCode == HttpStatus.ok) {
        final List<dynamic> categoryArr = categoryR.data['data'];
        categories = categoryArr.map((e) => CategoryModel.fromJson(e)).toList();
        String jsonString = jsonEncode(categoryR.data['data']);
        SharedPreferences.getInstance().then((value) {
          value.setString('categories', jsonString);
        });
        notifyListeners();
        return categories;
      }
    }
    return [];
  }

  Future<List<PaperItemModel>> getPaperItemModels(
      String cateId, int pageN) async {
    int pageNum = pageN * 15 + 1;
    String url =
        'http://wallpaper.apc.360.cn/index.php?c=WallPaper&a=getAppsByCategory&cid=$cateId&start=$pageNum&count=15&from=360chrome';
    List<PaperItemModel> paperItemModels = [];

    SharedPreferences _preferences = await SharedPreferences.getInstance();
    String? localData = _preferences.getString('papers$cateId');
    if (localData != null) {
      List<dynamic> jsonArray = jsonDecode(localData);
      paperItemModels =
          jsonArray.map((e) => PaperItemModel.fromJson(e)).toList();
      notifyListeners();
      return paperItemModels;
    } else {
      final paperRespone = await ApiService.get(url);
      if (paperRespone.statusCode == HttpStatus.ok) {
        final List<dynamic> paperArr = paperRespone.data['data'];
        paperItemModels =
            paperArr.map((e) => PaperItemModel.fromJson(e)).toList();
        String jsonString = jsonEncode(paperArr);
        SharedPreferences.getInstance().then((value) {
          value.setString('papers$cateId', jsonString);
        });
        notifyListeners();
        return paperItemModels;
      }
    }
    return [];
  }
}
