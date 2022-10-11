import 'package:flutter/material.dart';
import 'package:payment_app/compenents/colors.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackgound(),
        ],
      ),
    );
  }

  _mainBackgound() {
    return Positioned(
        child: Container(
      decoration: const  BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'))),
    ));
  }
}
