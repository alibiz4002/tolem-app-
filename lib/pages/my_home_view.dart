import 'package:flutter/material.dart';
import 'package:payment_app/compenents/colors.dart';

import '../widgets/text_size.dart';

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
            _listBills(),
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
          _curveImageContainer(),
          _buttonContainer(),
        ],
      ),
    );
  }

  _mainBackgound() {
    return Positioned(
        bottom: 10,
        left: 0,
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.png'))),
        ));
  }

  _curveImageContainer() {
    return Positioned(
        left: 0,
        right: -2,
        bottom: 10,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.14,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/images/curve.png'))),
        ));
  }

  _buttonContainer() {
    return Positioned(
        // left: 0,
        right: 43,
        bottom: 25,
        child: Container(
          height: 60,
          width: 60,
          // height: MediaQuery.of(context).size.height * 0.14,
          decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/lines.png')),
            boxShadow: [
              BoxShadow(
                  blurRadius: 15,
                  offset: Offset(0, 1),
                  color: Appcolors.menuButtonColor.withOpacity(0.2))
            ],
          ),
        ));
  }

  _listBills() {
    return Positioned(
      top: 320,
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                  color: Appcolors.billShodowColor,
                  offset: const Offset(1, 1),
                  blurRadius: 20.0,
                  spreadRadius: 10),
            ]),
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 18),
          child: Row(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 3, color: Colors.grey),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/brand1.png'))),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kengen Power',
                          style: TextStyle(
                              fontSize: 16,
                              color: Appcolors.mainColor,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'ID: 846594',
                          style: TextStyle(
                              fontSize: 16,
                              color: Appcolors.idColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
                const TextSizeWidget(
                  text: 'Auto pay on 24th May 18',
                  color: Colors.green,
                ),
                SizedBox(height: 5),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
