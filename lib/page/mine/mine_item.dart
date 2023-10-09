import 'package:flutter/material.dart';
import 'package:wallet_paper_main/model/mine_item_model.dart';

class MineItem extends StatefulWidget {
  const MineItem({Key? key, required this.item}) : super(key: key);
  final MineItemModel item;
  @override
  State<MineItem> createState() => _MineItemState();
}
  
class _MineItemState extends State<MineItem> {

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Container(
      height: 60,
      child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(item.title!,textAlign: TextAlign.left,),
            ),
          ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (item.subImage != null)
                 Image.asset(item.subImage!,width: 30,height: 30,),
              if (item.subTitle != null)
                 Text(item.subTitle!),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset(item.arrowImage!),
                ),
            ]
          ))
      ]
    ),
    );
  }
}