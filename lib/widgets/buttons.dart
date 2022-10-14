import 'package:flutter/material.dart';
import 'package:payment_app/compenents/colors.dart';

class Appbuttons extends StatelessWidget {
  final double? fontsize;
  final IconData? icon;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final String? text;
  const Appbuttons(
      {super.key,
      this.fontsize = 20,
      this.icon,
      this.onTap,
      this.backgroundColor = Colors.blue,
      this.iconColor = Colors.white,
      this.textColor = Colors.blue,
      this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor,
            ),
            child: Icon(icon, size: 30, color: iconColor),
          ),
          text != null
              ? Text(
                  text!,
                  style: TextStyle(fontSize: 14, color: textColor),
                )
              : Container(),
        ],
      ),
    );
  }
}
