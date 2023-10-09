import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

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
            child: Stack(
              children: [
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
              Positioned(
                bottom: 40,
                right: 32,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.black,
                  ),
                  child: IconButton(
                  onPressed: () {
 
                  },
                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  )
                ),
                ))
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
