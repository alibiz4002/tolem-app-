import 'package:flutter/material.dart';
import 'package:payment_app/compenents/colors.dart';

class LargeButtonWigdet extends StatelessWidget {
  final Color? backgroundcolor;
  final Color? textcolor;
  final Function()? onTap;
  final String text;
  final bool? isBorder;
  const LargeButtonWigdet(
      {super.key,
      this.backgroundcolor = const Color.fromARGB(255, 20, 62, 96),
      this.textcolor,
      this.onTap,
      this.isBorder = false,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Appcolors.mainColor)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: textcolor),
          ),
        ),
      ),
    );
  }
}
