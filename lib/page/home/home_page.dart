import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_paper_main/model/category_model.dart';
import 'package:wallet_paper_main/page/all/all_page.dart';
import 'package:wallet_paper_main/page/base/base_navi/custom_app_bar.dart';
import 'package:wallet_paper_main/page/home/home_page_component.dart';
import 'package:wallet_paper_main/provider/data_provider.dart';

// ignore: must_be_immutable

class HomePage extends StatefulWidget {
 const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  List <CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
     _loadCategories();
  }
  Future<void> _loadCategories() async {
  List<CategoryModel> cateArr = await DataProvider().getCategories();
    setState(() {
      categories = cateArr;
    });
  }

  @override
  Widget build(BuildContext context) {
     
    return  DefaultTabController(
      length: categories.length, 
      child:Scaffold(
        appBar: AppBar(
          title: const Text('home'),
          bottom:  TabBar(
            isScrollable: true,
            tabs: categories.map((category) => Tab(text: category.name)).toList(),
            ),

        ),
        body: TabBarView(
          children: _getTabBarViewWidgtes(categories),
           )
        ),
      );
  }

  List<Widget> _getTabBarViewWidgtes(List<CategoryModel> categories) {
    List<Widget> tabwidgets = [];
    for (var index = 0; index < categories.length; index++) {
      if (index == 0) {
        tabwidgets.add(AllPage(categories: categories));
      }else {
        tabwidgets.add(HomePageContentWidget(cateModel: categories[index]));
      }
    }
    return tabwidgets;
  }
}
