

import 'package:flutter/material.dart';
import 'package:wallet_paper_main/model/mine_item_model.dart';
import 'package:wallet_paper_main/page/mine/mine_item.dart';

class MineMutilItemsView extends StatefulWidget {
   MineMutilItemsView({Key? key, required this.itemList}) : super(key: key);
  final List<MineItemModel> itemList ;
  @override
  State<MineMutilItemsView> createState() => _MineMutilItemsViewState();
}
class _MineMutilItemsViewState extends State<MineMutilItemsView> {

  @override
  Widget build(BuildContext context) {
    final itemList = widget.itemList;
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 215, 215, 215),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        itemCount: itemList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return MineItem(item: itemList[index]);
        },
      ),
     ),
      );
  }
}