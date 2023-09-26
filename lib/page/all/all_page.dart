

import 'package:flutter/material.dart';
import 'package:wallet_paper_main/model/category_model.dart';
import 'package:wallet_paper_main/page/all/all_page_component.dart';

class AllPage extends StatelessWidget {
  AllPage({Key? key, required this.categories}) : super(key: key);
  final List<CategoryModel> categories ;

  @override
  Widget build(BuildContext context) {
      final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SingleChildScrollView(
      child:Container(
        child: Column(
        children:[
              AllPageComponent(cateModel: categories[1]), 
              AllPageComponent(cateModel: categories[2]), 
              AllPageComponent(cateModel: categories[3]), 
              AllPageComponent(cateModel: categories[4]), 
        ] 
      )
      ) 
    ));
    
  }
  
}