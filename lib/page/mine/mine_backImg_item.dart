import 'package:flutter/material.dart';

class MineBackImage extends StatelessWidget {

  const MineBackImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 60,
              width: MediaQuery.sizeOf(context).width - 32,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/item_back.png',
                        fit: BoxFit.cover,
                        color: Colors.amberAccent,
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      bottom: 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '头像',
                        )
                      ),
                    ),
                   const Positioned(
                      right: 20,
                      bottom: 20,
                      child: Text(
                        '更换',
                      ))
                  ],
                ),
              ),
            );
  }
}