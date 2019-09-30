import 'package:flutter/material.dart';
import 'package:wan_android/pages/home/home_page.dart';
import 'package:wan_android/pages/mine/mine_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  PageController _pageController;
  List<Widget> _pages;
  int _index;

  @override
  void initState() {
    _index = 0;
    _pageController = PageController(initialPage: _index);
    _pages = [HomePage(), MinePage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          },
          items: [
            BottomBarItem('assets/images/home_def.png',
                    'assets/images/home_active.png', '首页')
                .generate(),
            BottomBarItem('assets/images/mine_def.png',
                    'assets/images/mine_active.png', '我的')
                .generate(),
          ]),
    );
  }
}

class BottomBarItem {
  String iconPath;
  String activeIconPath;
  String title;

  BottomBarItem(this.iconPath, this.activeIconPath, this.title);

  BottomNavigationBarItem generate() {
    return BottomNavigationBarItem(
        icon: Image.asset(
          iconPath,
          width: 24,
        ),
        activeIcon: Image.asset(
          activeIconPath,
          width: 24,
        ),
        title: Text(title));
  }
}
