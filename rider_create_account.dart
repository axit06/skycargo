import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:skycargo/bottomhomescreen.dart';
import 'package:skycargo/commun.dart';
import 'package:skycargo/home.dart';
import 'package:skycargo/sing_up_pos.dart';

import 'model/fonts.dart';

// ignore: camel_case_types
class Rider_create_account extends StatefulWidget {
  const Rider_create_account({super.key});

  @override
  State<Rider_create_account> createState() => _Rider_create_accountState();
}

// ignore: camel_case_types
class _Rider_create_accountState extends State<Rider_create_account> {
  TextEditingController Phonecontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 14,right: 14),
            child: Column(
              children: [
                communelevated(context,title: "Create account", onPressed: (){
                  Get.to(const Bottomhomepage());
                }),
                const SizedBox(height: 10),
                Center(
                  child: InkWell(
                    onTap: (){
                      Get.to(const Sing_up_pos());
                    },
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                                color: const Color(0xff1b1b1b),
                                fontFamily: Fontfamaly.gilroyMedium,
                                fontSize: 17)),
                        TextSpan(
                            text: "Log in",
                            style: TextStyle(
                                color: const Color(0xff5e59ff),
                                fontSize: 17,
                                fontFamily: Fontfamaly.gilroyMedium)),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backarrow(),
                const SizedBox(height: 15),
                Text("Create your account",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 24,fontFamily: Fontfamaly.gilroyBold),),
                const SizedBox(height: 7),
                RichText(text: TextSpan(children: [
                  TextSpan(text:  "Want to register as Driver? ",style: TextStyle(color: Colors.grey,fontFamily: Fontfamaly.gilroyMedium)),
                  TextSpan(text:  "Click here",style: TextStyle(color: const Color(0xff5e59ff),fontFamily: Fontfamaly.gilroyMedium)),
                ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Your name",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 16,fontFamily: Fontfamaly.gilroyMedium),),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6,right: 20,top: 7,bottom: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.41,
                        height: 47,
                        child: TextField(
                          decoration: InputDecoration(
                             contentPadding: const EdgeInsets.all(10),
                              border: const OutlineInputBorder(),
                              hintText: "First name",
                              hintStyle: TextStyle(fontSize: 15,color: Colors.grey,fontFamily: Fontfamaly.gilroyMedium),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff5e59ff)),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffd3d6da)),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              )
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7,bottom: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.41,
                        height: 51,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: const OutlineInputBorder(),
                              hintText: "Last name",
                              hintStyle: TextStyle(fontSize: 15,color: Colors.grey,fontFamily: Fontfamaly.gilroyMedium),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff5e59ff)),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffd3d6da)),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                communtextfiled(title:"Email",text:"Test@gmail.com"),
                Text("Phone No.",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 16,fontFamily: Fontfamaly.gilroyMedium),),
                const SizedBox(
                  height: 7,
                ),
               phonecallcountry(Phonecontrol: Phonecontrol),
                const SizedBox(
                  height: 10,
                ),
               communtextfiled(title: "Vehicle License Plate", text: "Enter Address"),
                communtextfiled(title: "Password", text: "*********"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
