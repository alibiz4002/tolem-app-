import 'package:flutter/material.dart';
import 'package:payment_app/pages/paymet_page.dart';
import 'package:payment_app/widgets/buttons.dart';
import 'package:get/get.dart';
import '../compenents/colors.dart';
import '../controller/data.controller.dart';
import '../widgets/large_button.dart';
import '../widgets/text_size.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  final DataController controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    print('i am testing ${controller.list} is empty');
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Obx(() {
              if (controller.loading == false) {
                return Center(
                    child: Container(
                        width: 70,
                        height: 70,
                        child: CircularProgressIndicator(
                          color: AppColors.mainColor,
                        )));
              } else {
                return _listBills();
              }
              ;
            }),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return SizedBox(
      height: 310,
      child: Stack(
        children: [
          _mainBackgound(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
        // left: 0,
        right: 43,
        bottom: 25,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext bc) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 230,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              color: const Color(0xFFeef1f4).withOpacity(0.7),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 290,
                            )),
                        Positioned(
                            top: 0,
                            right: 45,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 25),
                              width: 60,
                              height: 260,
                              decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(29)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Appbuttons(
                                    icon: Icons.cancel,
                                    iconColor: AppColors.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Appbuttons(
                                      icon: Icons.add,
                                      iconColor: AppColors.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: () {},
                                      text: 'Add Bill'),
                                  Appbuttons(
                                      icon: Icons.history,
                                      iconColor: AppColors.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: () {},
                                      text: 'History'),
                                ],
                              ),
                            ))
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/images/lines.png')),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(0, 1),
                    color: AppColors.menuButtonColor.withOpacity(0.2))
              ],
            ),
          ),
        ));
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
      ),
    );
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

  _listBills() {
    return Positioned(
      top: 300,
      right: 0,
      bottom: 0,
      left: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: controller.list.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 10, right: 20),
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
                        color: AppColors.billShodowColor,
                        offset: const Offset(1, 1),
                        blurRadius: 20.0,
                        spreadRadius: 10),
                  ]),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Colors.grey),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            controller.list[index]['img']))),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.list[index]['brand'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.mainColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'ID:${controller.list[index]['id'].toString()}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.idColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          TextSizeWidget(
                            text: controller.list[index]['more'],
                            color: Colors.green,
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.list[index]['status'] =
                                      !controller.list[index]['status'];
                                  print(controller.list[index]['status']);
                                  controller.list.refresh();
                                  print(controller.newList.length);
                                },
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: controller.list[index]['status'] ==
                                              false
                                          ? AppColors.selectBackground
                                          : AppColors.mainColor),
                                  child: Center(
                                    child: Text(
                                      'Select',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: controller.list[index]
                                                      ['status'] ==
                                                  false
                                              ? AppColors.selectcolor
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                '\$${controller.list[index]['price']}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.mainColor),
                              ),
                              Text(
                                controller.list[index]['due'],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.idColor),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 5,
                            height: 35,
                            decoration: BoxDecoration(
                                color: AppColors.halfOval,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                )),
                          )
                        ],
                      )
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }

  _payButton() {
    return Positioned(
      bottom: 10,
      child: LargeButtonWidget(
        text: 'Pay all bills',
        textcolor: Colors.white,
        onTap: () {
          Get.to(() => const PaymentPage());
        },
      ),
    );
  }

  _textContainer() {
    return Stack(
      children: const [
        Positioned(
          left: 0,
          top: 100,
          child: Text(
            'My Bills',
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Color(0xFF293952)),
          ),
        ),
        Positioned(
            left: 40,
            top: 80,
            child: Text(
              'My Bills',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ],
    );
  }
}
