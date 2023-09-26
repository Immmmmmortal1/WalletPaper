import 'package:flutter/material.dart';
import 'package:wallet_paper_main/page/mine/mine_header.dart';

class MinePage extends StatelessWidget {

    const MinePage({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
        return const SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MineHeader(),
              ],
            )
          ));
        
    }


}