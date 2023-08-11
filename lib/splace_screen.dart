import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skycargo/model/fonts.dart';
import 'package:skycargo/sing_up_pos.dart';

class Splace_screen extends StatefulWidget {
  const Splace_screen({super.key});

  @override
  State<Splace_screen> createState() => _Splace_screenState();
}

class _Splace_screenState extends State<Splace_screen> {
  int currentIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
              padding: const EdgeInsets.only(left: 280, top: 10),
              child: InkWell(
                onTap: (){
                  Get.to(const Sing_up_pos());
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: Fontfamaly.gilroyBold,
                      color: const Color(0xff5e59ff)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 15),
              child: SizedBox(
                height: 600,
                width: double.infinity,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: controller,
                      itemCount: 3,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                        print(currentIndex.toString());
                        print(value.toString());
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: currentIndex == 0
                                      ? Image.asset(
                                          'assets/No Transaction.png',
                                          width: 300,
                                          height: 400,
                                        )
                                      : currentIndex == 1
                                          ? Image.asset(
                                              "assets/Outlet Empty.png",
                                              width: 300,
                                              height: 400,
                                            )
                                          : Image.asset(
                                              "assets/Customer Empty.png",
                                              width: 300,
                                              height: 400,
                                            )),
                              currentIndex == 0
                                  ? Text(
                                      "Easy products and\nsales management",
                                      style: TextStyle(
                                          color: const Color(0xff1b1b1b),
                                          fontSize: 30,
                                          fontFamily: Fontfamaly.gilroyBold))
                                  : currentIndex == 1
                                      ? Text(
                                          "Choose your own\npayment method",
                                          style: TextStyle(
                                              color: const Color(0xff1b1b1b),
                                              fontSize: 30,
                                              fontFamily: Fontfamaly.gilroyBold))
                                      : Text(
                                          "Manage branch\nwithout worries",
                                          style: TextStyle(
                                              color: const Color(0xff1b1b1b),
                                              fontSize: 30,
                                              fontFamily: Fontfamaly.gilroyBold)),
                              const SizedBox(
                                height: 10,
                              ),
                              currentIndex == 0
                                  ? Text(
                                      "Effortlessly manage all your store transaction\nand products in one app",
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontFamily: Fontfamaly.gilroyMedium),
                                      textAlign: TextAlign.center)
                                  : currentIndex == 1
                                      ? Text(
                                          "Seamless payout with various payment method\nyou can choose from",
                                          style: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontFamily: Fontfamaly.gilroyMedium),
                                          textAlign: TextAlign.center)
                                      : Text(
                                          "Track all your store branches and operation with\nconfidence",
                                          style: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontFamily: Fontfamaly.gilroyMedium),
                                          textAlign: TextAlign.center),
                            ]);
                      },
                    ),
                    Positioned(
                      bottom: 260,
                      left: MediaQuery.of(context).size.width/2.2,
                      right: 0,
                      child: SizedBox(
                        height: 15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                currentIndex;
                              },
                              child: Container(
                                width: currentIndex == index ? 15 : 8,
                                height: 10,
                                margin: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xff1b1b1b)),
                                  color: currentIndex == index
                                      ? const Color(0xff1b1b1b)
                                      : Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff5e59ff),shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),fixedSize: Size(MediaQuery.of(context).size.width*0.9,50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Continue",style: TextStyle(color: Colors.white,fontSize: 21,fontFamily: Fontfamaly.gilroyBold)),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward,color: Colors.white,)
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
