import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skycargo/bottomhomescreen.dart';
import 'package:skycargo/commun.dart';

import 'package:skycargo/model/fonts.dart';
import 'package:skycargo/sing_up_pos.dart';

import 'controllers/logincontroller.dart';

// ignore: camel_case_types
class Create_your_account extends StatefulWidget {
  const Create_your_account({super.key});

  @override
  State<Create_your_account> createState() => _Create_your_accountState();
}

// ignore: camel_case_types
class _Create_your_accountState extends State<Create_your_account> {
  final controller = Get.find<LoginController>();
  // ignore: non_constant_identifier_names
  TextEditingController Phonecontrol = TextEditingController();

  final List<String> genderItems1 = [
    'Bihar',
    'Assam',
    'Chhattisgarh',
    'Goa',
    'Chennai',
    'Kolkata',
    'Gujarat',
    'Maharashtra',
    'Argentina'
  ];
  final List<String> genderItems2 = [
    'Amreli',
    'Ahmadabad',
    'Bhavnagar',
    'Bhuj',
    'Dwarka',
    'Gandhinagar',
    'Surat',
    'Rajkot',
    'Surendranagar'
  ];
  final List<String> genderItems3 = [
    '365421',
    '395120',
    '395021',
    '412940',
    '290435',
    '304567',
    '394100',
    '498204',
    '769493'
  ];
  String selectedValue0 = "";
  String selectedValue1 = "";
  String selectedValue2 = "";
  String? selectedValue3;
  int cid = 0;
  int ctid = 0;
  @override
  void initState() {
    super.initState();
    controller.Statedatas(cid);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<LoginController>(
            builder: (controller){
              return Padding(
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
                    const SizedBox(height: 10),
                    Text("Your name",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 16,fontFamily: Fontfamaly.gilroyMedium),),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7,bottom: 15),
                          child: SizedBox(
                            width: Get.width*0.45,
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
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 7,bottom: 15),
                          child: SizedBox(
                            width: Get.width*0.45,
                            height: 47,
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
                      height: 7,
                    ),
                    communtextfiled(title: "Password", text: "*********"),
                    communtextfiled(title: "Address", text: "Enter Address"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Country",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 16,fontFamily: Fontfamaly.gilroyMedium),),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.34,
                        ),
                        Text("Status",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 16,fontFamily: Fontfamaly.gilroyMedium),),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(width: Get.width*0.45, height: 47,
                          child: DropdownButtonFormField2(
                            isExpanded: true,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                )
                            ),
                            hint: Text('Search Country', style: TextStyle(fontSize: 14,fontFamily: Fontfamaly.gilroyMedium)),
                            items: controller.countryname[0].countries.map((item) => DropdownMenuItem(
                              onTap: () {
                                setState(() {
                                  cid = item.id;
                                  controller.Statedatas(cid);
                                });
                              },
                              value: item.countriesName,
                              child: Text(item.countriesName, style: const TextStyle(fontSize: 14)),
                            )).toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                              return null;
                            },
                            onChanged: (value){
                              setState(() {
                                selectedValue0 = value.toString();
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                  selectedValue0 = value.toString();
                              });
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: IconStyleData(icon: Icon(Icons.arrow_drop_down, color: Colors.grey.withOpacity(0.7)),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(width: Get.width*0.45, height: 47,
                          child: DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                )
                            ),
                            hint: Text('Search State', style: TextStyle(fontSize: 14,fontFamily: Fontfamaly.gilroyMedium)),
                            items: selectedValue0.isNotEmpty ? controller.statelist[0].stateData.map((item) => DropdownMenuItem<String>(
                              value: item.stateName,
                              onTap: (){
                                setState(() {
                                  ctid = item.id;
                                  controller.Citysdata(ctid);
                                });
                              },
                              child: Text(item.stateName,
                                style: const TextStyle(fontSize: 14),
                              ),)).toList(): [
                              DropdownMenuItem(child: Text('Search State', style: TextStyle(color: Colors.grey.shade600,fontSize: 14,fontFamily: Fontfamaly.gilroyMedium))),
                            ],
                            validator: (value) {
                              if (value == null) {
                                return 'Please select status.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                selectedValue1 = value.toString();
                              });
                            },
                            onSaved: (value) {
                                selectedValue1 = value.toString();
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey.withOpacity(0.7),
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text("City",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 16,fontFamily: Fontfamaly.gilroyMedium),),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.42,
                        ),
                        Text("Zip code",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 16,fontFamily: Fontfamaly.gilroyMedium),),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width*0.45,
                          height: 47,
                          child: DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                )
                            ),
                            hint: Text('Search City',style: TextStyle(fontSize: 14,fontFamily: Fontfamaly.gilroyMedium)),
                            items: selectedValue1.isNotEmpty ? controller.citylist[0].cityData
                                .map((item) => DropdownMenuItem<String>(
                              value: item.cityName,
                              child: Text(item.cityName, style: const TextStyle(fontSize: 14)),
                            )).toList():
                            [
                              DropdownMenuItem(child: Text('Search City', style: TextStyle(color: Colors.grey.shade600,fontSize: 14,fontFamily: Fontfamaly.gilroyMedium))),
                            ],
                            validator: (value) {
                              if (value == null) {
                                return 'Please select City.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              selectedValue2 = value.toString();
                            },
                            onSaved: (value) {
                              selectedValue2 = value.toString();
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey.withOpacity(0.7),
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: Get.width*0.45,
                          height: 47,
                          child: DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                )
                            ),
                            hint: Text('Enter zip code', style: TextStyle(fontSize: 14,fontFamily: Fontfamaly.gilroyMedium),),
                            items: genderItems3
                                .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select zip code.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                            },
                            onSaved: (value) {
                              selectedValue3 = value.toString();
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey.withOpacity(0.7),
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    communelevated(context,title: "Create Account",onPressed: () {Get.to(const Bottomhomepage());},),
                    const SizedBox(height: 15),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
