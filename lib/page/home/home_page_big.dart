import 'package:flutter/material.dart';

class HomePageBig extends StatelessWidget {
  const HomePageBig({Key? key, required this.tag, required this.bigimageurl})
       : super(key: key);
  final String tag;
  final String bigimageurl;


  @override
  Widget build(BuildContext context) {


    return Container(
        color: Colors.white,
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Stack(children: [
              loadingWidget(true),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Hero(
                  tag: tag, // 使用与原始页面相同的 tag
                  child: Image.network(
                    bigimageurl,
                    fit: BoxFit.fitHeight,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return loadingWidget(false);
                      }
                    },
                  ),
                ),
              ),
            ])));
  }

  Widget loadingWidget(bool isshow) {
    return Center(
      child: Visibility(
        visible: isshow,
        child: const CircularProgressIndicator(color: Colors.black)
        ),
    );
  }
}
