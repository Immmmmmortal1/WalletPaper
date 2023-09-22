import 'package:flutter/material.dart';
import 'package:wallet_paper_main/utils/text_style.dart';

AppBar customAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title,style: ProjectStyles.appBarStyle),
    backgroundColor: Colors.grey,

  );
}