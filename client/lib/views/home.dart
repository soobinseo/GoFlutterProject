import 'package:flutter/material.dart';
import 'package:client/views/feed.dart';
import 'package:client/views/curator.dart';
import 'package:client/views/mypage.dart';
import 'package:client/controllers/navBarController.dart';

import 'package:get/get.dart';

class HomeView extends StatelessWidget {

   final NavBarController _navBarController= Get.put(NavBarController());

  final List<Widget> _views = [
    FeedView(),
    CuratorView(),
    MyPageView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Obx(
                () =>
                   _views.elementAt(_navBarController.currentIndex)
                  ),
        bottomNavigationBar: Obx(
            () =>
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "홈"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: "큐레이터"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "마이페이지"
                  ),

                ],

            currentIndex: _navBarController.currentIndex,
                onTap: (index) => _navBarController.currentIndex = index,

            )
          ),
        );
  }
}