import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_expedition_travel/global/size_config.dart';
import 'package:sy_expedition_travel/provider/pageoffset_notifier.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageOffsetNotifier(_pageController),
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              PageView(
                controller: _pageController,
                physics: ClampingScrollPhysics(),
                children: [
                  LeopardScreen(),
                  VultureScreen(),
                ],
              ),
              AppBar(),
              LeopardImage(),
              VultureImage(),
            ],
          ),
        ),
      ),
    );
  }
}

class LeopardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Consumer<PageOffsetNotifier>(
      builder: (context, pageoffsetNotifier, child) => Positioned(
        left: (-pageoffsetNotifier.offset) * .8,
        width: _size.width * 1.5,
        child: child,
      ),
      child: IgnorePointer(
        child: Image.asset('assets/leopard.png'),
      ),
    );
  }
}

class VultureImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Consumer<PageOffsetNotifier>(
      builder: (context, pageoffsetNotifier, child) => Positioned(
        child: child,
        left: (_size.width * 1.15) + (-pageoffsetNotifier.offset) * .8,
      ),
      child: IgnorePointer(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Image.asset(
            'assets/vulture.png',
            height: _size.height * .37,
          ),
        ),
      ),
    );
  }
}

class LeopardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class VultureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
          child: Row(
            children: [
              Text('SY'),
              Spacer(),
              Icon(Icons.menu),
            ],
          ),
        ),
      ),
    );
  }
}
