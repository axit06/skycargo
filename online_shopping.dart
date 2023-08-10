import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycargo/Createprealert.dart';
import 'package:skycargo/customer.dart';
import 'package:skycargo/commun.dart';
import 'package:skycargo/listofpackege.dart';

import 'model/fonts.dart';

class OnlineShopping extends StatefulWidget {
  const OnlineShopping({super.key});

  @override
  State<OnlineShopping> createState() => _OnlineShoppingState();
}

class _OnlineShoppingState extends State<OnlineShopping> {

  List radioName = [
    "Pre_Alert List",
    "Create Pre_Alert",
    "List Of Packages"
  ];
  // ignore: prefer_typing_uninitialized_variables
  var revalue;
  int? covalue;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 17,right: 17,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Online Shopping",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 20,fontFamily: Fontfamaly.gilroyBold),)),
              const SizedBox(height: 15),
              Center(child: Text("Please fill all required data to continue using this app smothly.", style: TextStyle(fontSize: 13,color: Colors.grey,fontFamily: Fontfamaly.gilroyMedium)),),
              const SizedBox(height: 12),
              Text("What do i use this app for?",
                style: TextStyle(fontSize: 16, fontFamily: Fontfamaly.gilroyMedium),
              ),
              const SizedBox(height: 7),
              ListView.builder(physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: 3,itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        revalue = index;
                        covalue = index;
                      });
                    },
                    child: Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width*0.99,
                      decoration: BoxDecoration(
                        color: revalue == index? const Color(0xff7975ff).withOpacity(0.1):Colors.transparent,
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          // ignore: unrelated_type_equality_checks
                          border: Border.all(color: revalue == index ? const Color(0xff7975ff) :Colors.grey.withOpacity(0.4))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              Radio(
                                value: index,
                                fillColor:
                                MaterialStateColor.resolveWith((states) => revalue == index? const Color(0xff7975ff) : Colors.grey.shade400),
                                groupValue: revalue,
                                onChanged: (value) {
                                  setState(() {
                                    revalue = value;
                                  });
                                },
                              ),
                              Text("${radioName[index]}",style: TextStyle(fontSize: 16, fontFamily: Fontfamaly.gilroyMedium)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14,top: 3),
                            child: Text("For those who are just want to explore the app's feature.",style: TextStyle(fontSize: 15,color: Colors.grey.shade500, fontFamily: Fontfamaly.gilroyMedium)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },),
              const Spacer(),
              communelevated(context,title: "Continue",onPressed: (){
                if(covalue != null){
                  if(covalue == 0){
                    Get.to(const Customer());
                  }
                  else if(covalue == 1){
                    Get.to(const Createprialert());
                  }else{
                    Get.to(const Listofpackeg());
                  }
                }
              },),
            ],
          ),
        ),
      ),
    );
  }
}
