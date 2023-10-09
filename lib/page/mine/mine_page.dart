import 'package:flutter/material.dart';
import 'package:wallet_paper_main/model/mine_item_model.dart';
import 'package:wallet_paper_main/page/mine/mine_backImg_item.dart';
import 'package:wallet_paper_main/page/mine/mine_header.dart';
import 'package:wallet_paper_main/page/mine/mine_multi_items_view.dart';

class MinePage extends StatelessWidget {

    MinePage({Key? key}) : super(key: key);
   final List<MineItemModel> middleItems = [
        MineItemModel(
            title: '我的收藏',
            subTitle: '',
            arrowImage: 'assets/images/mine_more.png',
        ),
        MineItemModel(
            title: '我的分享',
            subTitle: '',
            subImage: 'assets/images/app_icon.png',
            arrowImage: 'assets/images/mine_more.png',
        ),
        MineItemModel(
            title: '设置',
            subTitle: '更多',
            arrowImage: 'assets/images/mine_more.png',
        ),
    ];
   
    @override
    Widget build(BuildContext context) {
      
        return  SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                MineHeader(),
                SizedBox(height: 30,),
                MineBackImage(),
                SizedBox(height: 30,),
                MineMutilItemsView(itemList: middleItems),
              ],
            )
          ));
        
    }


}