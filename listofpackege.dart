import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skycargo/registerpackeges.dart';

import 'Createprealert.dart';
import 'commun.dart';
import 'model/fonts.dart';

class Listofpackeg extends StatefulWidget {
  const Listofpackeg({super.key});

  @override
  State<Listofpackeg> createState() => _ListofpackegState();
}

class _ListofpackegState extends State<Listofpackeg> {
  List date = [
    "5/2/2023",
    "3/1/2023",
    "4/3/2023",
    "5/4/2023",
    "9/5/2023",
    "7/6/2023",
    "10/7/2023",
    "6/8/2023",
    "5/9/2023",
    "4/8/2023",
  ];
  // ignore: non_constant_identifier_names
  List Purchese = [
    "200021",
    "111111",
    "202020",
    "212121",
    "101010",
    "203947",
    "457684",
    "345678",
    "546789",
    "029476"
  ];
  List price = [
    "\$100",
    "\$200",
    "\$300",
    "\$400",
    "\$500",
    "\$600",
    "\$600",
    "\$700",
    "\$800",
    "\$900",
  ];

  List sheetname = [
    "Show Details",
    "Assign Driver",
    "Print shipment",
    "Print label",
    "Shipment Tracking",
    "Deliver The Shipment",
    "Override Shipment",
  ];

  List sheetimage = [
    "assets/BellRinging.png",
    "assets/Car.png",
    "assets/Printer.png",
    "assets/Files.png",
    "assets/ArrowsCounterClockwise.png",
    "assets/Package.png",
    "assets/XCircle.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: backarrow(),
          centerTitle: true,
          title: Text("List of Packages",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 19,fontFamily: Fontfamaly.gilroyBold),),
          actions: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(const Createprialert());
                  },
                  child: Container(
                    height: 35,
                    width: 80,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color(0xff5e59ff)
                    ),
                    child: InkWell(
                      onTap: (){
                        Get.to(const Registerpackeges());
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 6),
                          const Icon(Icons.add,color: Colors.white,size: 17),
                          Text("New Add",style: TextStyle(color: Colors.white,fontSize: 11,fontFamily: Fontfamaly.gilroyMedium),)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 7,)
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 17,right: 17,top: 10),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: SearchBar(
                      leading: Image.asset("assets/MagnifyingGlass.png",color: Colors.grey.shade600,height: 22,width: 22),
                      elevation: MaterialStateProperty.resolveWith((states) => 0),
                      side: MaterialStateProperty.all(BorderSide(color: Colors.grey.withOpacity(0.5))),
                      shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                      hintText: "Search",
                      hintStyle: MaterialStateProperty.all(TextStyle(color: Colors.grey.shade600,fontSize: 15,fontFamily: Fontfamaly.gilroyMedium)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1,),
                  const SizedBox(height: 10),
                  ListView.builder(physics: const NeverScrollableScrollPhysics(),itemCount: 10,shrinkWrap: true,itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 18,top: 7,right: 18),
                              child: SizedBox(
                                height: 348,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 65,
                                      height: 6,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                                          color: Colors.grey.shade300
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ListView.builder(shrinkWrap: true,itemCount: sheetname.length,itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(sheetimage[index],width: 22,height: 22),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(sheetname[index],style: TextStyle(fontSize: 15,fontFamily: Fontfamaly.gilroyMedium),)
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          const Divider(thickness: 1,),
                                          const SizedBox(height: 4),
                                        ],
                                      );
                                    },),

                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text("Date: ${date[index]}",style: TextStyle(fontSize: 13,fontFamily: Fontfamaly.gilroyMedium))),
                              Container(
                                height: 25,
                                width: 64,
                                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color(0xfff0f0ff)),
                                child: Center(child: Text("Success",style: TextStyle(color: const Color(0xff5e59ff),fontSize: 11,fontFamily: Fontfamaly.gilroyMedium))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(child: Text("Tracking ID",style: TextStyle(fontSize: 13,fontFamily: Fontfamaly.gilroyMedium))),
                              Text("#${Purchese[index]}",style: TextStyle(fontSize: 13,fontFamily: Fontfamaly.gilroyMedium)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(child: Text("Customer Name",style: TextStyle(fontSize: 13,fontFamily: Fontfamaly.gilroyMedium))),
                              Text("Vivek patel",style: TextStyle(fontSize: 13,fontFamily: Fontfamaly.gilroyMedium)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(child: Text("Purchese price",style: TextStyle(fontSize: 13,fontFamily: Fontfamaly.gilroyMedium))),
                              Text("${price[index]}",style: TextStyle(fontSize: 13,fontFamily: Fontfamaly.gilroyMedium)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  },)

                ],
              ),
            ),
          ),
        )
    );
  }
}
