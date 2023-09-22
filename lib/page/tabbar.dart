import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wallet_paper_main/page/home/home_page.dart';
import 'package:wallet_paper_main/page/mine/mine_page.dart';

class MyTabbar extends StatefulWidget {

  const MyTabbar({Key? key}) : super(key: key);

  @override
  _MyTabbarState createState() => _MyTabbarState();

}
// SingleTickerProviderStateMixin作用 为了在State类中方便地使用AnimationController，以便控制和更新动画。

class _MyTabbarState extends State<MyTabbar> with SingleTickerProviderStateMixin {
  
  late final TabController _tabController;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length:  _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length, 
      child: Scaffold(
         extendBody: true,
         bottomNavigationBar: BottomAppBar(
          height: 70,
          notchMargin: _notchedValue,
          child: _buildTabBar()
          ),
         body: _buildTabBarView()
      )
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
    
      controller: _tabController,
      tabs: _MyTabViews.values.map((e) => Tab(
        icon: Image.asset('assets/images/${e.iconName}.png',),
        )).toList(),
    );
  }
  TabBarView _buildTabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        HomePage(),
        MinePage()
      ],
    );
  }
}

enum _MyTabViews {
  home,
  mine,
}

extension _MyTabbarViewExtension on _MyTabViews {
  String get name {
    switch (this) {
      case _MyTabViews.home:
        return tr('home_tabbar_title');
      case _MyTabViews.mine:
        return tr('mine_tabbar_title');
      default:
        return '';
    }
  }
   String get iconName {
    switch (this) {
      case _MyTabViews.home:
        return 'home';
      case _MyTabViews.mine:
        return 'mine';
      default:
        return '';
    }
  }
}