import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../constants/sizes.dart';
import '../home/HomeScreen.dart';
import '../write/WriteScreen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "write",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // write 에서 업로드 후 home 화면으로 이동시 필요
    _selectedIndex = _tabs.indexOf(widget.tab);
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: WriteScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.size56,
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 2,
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size36,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _onTap(0),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.house,
                            color: _selectedIndex == 0
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _onTap(1),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.penClip,
                            color: _selectedIndex == 1
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
