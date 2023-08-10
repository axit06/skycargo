import 'package:flutter/material.dart';

import 'commun.dart';
import 'model/fonts.dart';

class Addsender extends StatefulWidget {
  const Addsender({super.key});

  @override
  State<Addsender> createState() => _AddsenderState();
}

class _AddsenderState extends State<Addsender> {
  // ignore: non_constant_identifier_names
  TextEditingController Phonecontrol = TextEditingController();
  int groupValue1 = 1;
  bool plus = false;
  int add = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding:
        const EdgeInsets.only(left: 20, right: 20, bottom: 12, top: 10),
        color: Colors.white,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                  height: 40,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xff5c61f2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                      child: Text(
                        "Back",
                        style: TextStyle(
                            fontFamily: Fontfamaly.gilroyMedium,
                            color: Colors.white),
                      ))),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {},
                child:
                 Container(
                    height: 40,
                    width: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xff5c61f2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontFamily: Fontfamaly.gilroyMedium,
                              color: Colors.white),
                        )))
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: backarrow(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Directions",style: TextStyle(color: Colors.black,fontFamily: Fontfamaly.gilroyBold,fontSize: 17),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
          child: SizedBox(
              height: 700,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      communtextfiled(title: "First Name",text: "Enter First Name"),
                      communtextfiled(title: "Last Name",text: "Enter Last Name"),
                      communtextfiled(title: "E-Mail",text: "Enter E-Mail"),
                      communtextfiled(title: "Password",text: "Enter Password"),
                      Text("Phone No.",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 15,fontFamily: Fontfamaly.gilroyMedium),),
                      const SizedBox(height: 7,),
                      phonecallcountry(Phonecontrol: Phonecontrol),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Text("Add Another Address",style: TextStyle(fontSize: 15,fontFamily: Fontfamaly.gilroyBold),),
                          const Spacer(),
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(plus == true){
                                  add++;
                                }
                                plus = true;
                              });
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children:[
                                Container(
                                height: 35,
                                width: 37,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    color: Color(0xff5e59ff)),
                                child: Center(
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: Fontfamaly.gilroyMedium),
                                    )),
                              ),
                                plus?
                                Positioned(
                                  right: -7,
                                  top: -5,
                                  child: CircleAvatar(
                                    radius: 8,
                                     backgroundColor: Colors.grey.shade100,
                                    child: Text("$add",style: TextStyle(color: Color(0xff5e59ff),fontFamily: Fontfamaly.gilroyBold,fontSize: 10),),
                                  ),
                                ):SizedBox()
                            ]
                            ),
                          ),
                          const SizedBox(width: 6)
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text("Country",
                          style: TextStyle(
                              color: const Color(0xff1b1b1b),
                              fontSize: 15,
                              fontFamily: Fontfamaly.gilroyMedium)),
                      const SizedBox(
                        height: 10,
                      ),
                      dropdowen(context, title: "Search Country"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("State",
                          style: TextStyle(
                              color: const Color(0xff1b1b1b),
                              fontSize: 15,
                              fontFamily: Fontfamaly.gilroyMedium)),
                      const SizedBox(
                        height: 10,
                      ),
                      dropdowen(context, title: "Search State"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("City",
                          style: TextStyle(
                              color: const Color(0xff1b1b1b),
                              fontSize: 15,
                              fontFamily: Fontfamaly.gilroyMedium)),
                      const SizedBox(height: 10),
                      dropdowen(context, title: "Search City"),
                      const SizedBox(height: 10),
                    communtextfiled(title: "Zip Code",text: "Enter Zip Code"),
                    communtextfiled(title: "Address",text: "Enter Address"),

                    plus?
                   ListView.builder(
                     physics: const NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemCount: add,
                     itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Add Another Address",style: TextStyle(fontSize: 15,fontFamily: Fontfamaly.gilroyBold),),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      add--;
                                      if(index == 0 ){
                                        plus = false;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(color: Colors.red)),
                                    child: Center(
                                        child: Image.asset(
                                          "assets/Trash.png",
                                          height: 20,
                                          width: 20,
                                          color: Colors.red,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text("Country",
                                style: TextStyle(
                                    color: const Color(0xff1b1b1b),
                                    fontSize: 15,
                                    fontFamily: Fontfamaly.gilroyMedium)),
                            const SizedBox(
                              height: 10,
                            ),
                            dropdowen(context, title: "Search Country"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("State",
                                style: TextStyle(
                                    color: const Color(0xff1b1b1b),
                                    fontSize: 15,
                                    fontFamily: Fontfamaly.gilroyMedium)),
                            const SizedBox(
                              height: 10,
                            ),
                            dropdowen(context, title: "Search State"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("City",
                                style: TextStyle(
                                    color: const Color(0xff1b1b1b),
                                    fontSize: 15,
                                    fontFamily: Fontfamaly.gilroyMedium)),
                            const SizedBox(height: 10),
                            dropdowen(context, title: "Search City"),
                            const SizedBox(height: 10),
                            communtextfiled(title: "Zip Code",text: "Enter Zip Code"),
                            communtextfiled(title: "Address",text: "Enter Address"),
                          ],
                        ),
                      );
                    },) :const SizedBox(),
                      Text("Customer Status",style: TextStyle(fontSize: 15,fontFamily: Fontfamaly.gilroyMedium,),),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: groupValue1,
                            activeColor: Colors.green,
                            onChanged: (int? newValue) {
                              setState(() {
                                groupValue1 = newValue!;
                              });
                            },
                          ),
                      const Text('Active'),
                      Radio(
                        value: 2,
                        activeColor: Colors.red,
                        groupValue: groupValue1,
                        onChanged: (int? newValue) {
                          setState(() {
                            groupValue1 = newValue!;
                          });
                        },
                      ),
                      const Text('Inactive'),
                        ],
                      ),
                    ]),
              )),
        ),
      ),
    );
  }
}
