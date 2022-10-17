import 'package:flutter/material.dart';
import 'package:payment_app/compenents/colors.dart';
import 'package:payment_app/widgets/buttons.dart';
import 'package:payment_app/widgets/large_button.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
 const  PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          height: h,
          width: w,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/paymentbackground.png')),
          ),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: h * 0.14,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/images/success.png')),
                ),
              ),
              Text(
                'Success !',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor),
              ),
              Text(
                'Payment is complited for 2 bills ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.idColor),
              ),
              SizedBox(height: h * 0.045),
              Container(
                height: 175,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: Colors.grey.withOpacity(0.5))),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 15, left: 20, bottom: 10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green),
                                child: const Icon(Icons.done,
                                    size: 30, color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'KenGen Power ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.mainColor),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'ID:7834874',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.idColor),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  const SizedBox(height: 30),
                                  Text(
                                    '\$1248.00 ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.mainColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
              Column(
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.idColor),
                  ),
                const   SizedBox(height: 5),
                  Text(
                    '\$2840.00',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainColor),
                  ),
                ],
              ),
              SizedBox(height: h * 0.14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Appbuttons(
                    icon: Icons.share_sharp,
                    onTap: () {},
                    text: 'share',
                    textColor: AppColors.mainColor,
                    backgroundColor: AppColors.mainColor,
                  ),
               const    SizedBox(width: 80),
                  Appbuttons(
                      icon: Icons.print_outlined,
                      onTap: () {},
                      text: 'print',
                      textColor: AppColors.mainColor,
                      backgroundColor: AppColors.mainColor),
                ],
              ),
              SizedBox(height: h * 0.02),
              LargeButtonWidget(
                text: 'Done',
                backgroundcolor: Colors.white,
                textcolor: AppColors.mainColor,
                onTap: () {
                  Get.back();
                },
              ),
            ],
          )),
    );
  }
}
  // FlutterLogo(
  //                               size: 100,
  //                             )

      // SizedBox(
      //                   width: 50,
      //                   height: 50,
      //                   child: DecoratedBox(
      //                       decoration: BoxDecoration(color: Colors.red)),
      //                 ),