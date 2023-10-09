
import 'package:flutter/material.dart';

class MineHeader extends StatelessWidget {

  const MineHeader({Key? key}) : super(key: key);
 final String headerurl = 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F12f18496-3075-4367-b599-ae390f0e0b37%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1698306898&t=358af69644d7a2ecb9c275468cc73456';
  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child:  Stack(
            children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(headerurl,height: 60,width: 60,fit: BoxFit.cover,),
                    ),
                  ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        color: Colors.green
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () => {}, 
                          icon: Image.asset('assets/images/camera.png',color: Colors.black,),
                          iconSize: 16,
                          ),
                      ),
                    ))
                ],
              ),
          ),
          Expanded( 
            flex: 2,
            child: Container(
            height: 60,
            padding:const EdgeInsets.only(left: 16.0),
            child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("哈哈哈哈"),
                  ),
                ),
      // Expanded(
      //   child: Align(
      //     alignment: Alignment.bottomLeft,
      //     child: Text("邮箱: 123456789@qq.com"),
      //   ),
      // ),
            ],
          ),
          ),
          ),
         Container(
           child: const Padding(
             padding: const EdgeInsets.only(right: 32.0),
             child: Icon(Icons.access_alarm)
           ),
         )
    ]);
  }
}