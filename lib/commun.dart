import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:skycargo/model/fonts.dart';

communelevated(BuildContext context,
    {void Function()? onPressed, required String title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff5e59ff),
        fixedSize: Size(MediaQuery.of(context).size.width * 0.99, 50),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        elevation: 0),
    onPressed: onPressed,
    child: Text(title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: Fontfamaly.gilroyMedium)),
  );
}

communtextfiled(
    {required String title, text, TextEditingController? controller, String? Function(String?)? validator}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            color: const Color(0xff1b1b1b),
            fontSize: 15,
            fontFamily: Fontfamaly.gilroyMedium,
            overflow: TextOverflow.ellipsis),
      ),
      const SizedBox(
        height: 5,
      ),
      TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            border: const OutlineInputBorder(),
            hintText: text,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontFamily: Fontfamaly.gilroyMedium,
                fontSize: 14),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xff5e59ff))),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xffd3d6da)))),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

backarrow() {
  return InkWell(
      onTap: () {
        Get.back();
      },
      child: Image.asset("assets/ArrowLeft.png"));
}

List<String> genderItems1 = [
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
// ignore: prefer_typing_uninitialized_variables
var selectedValue1;

dropdowen(BuildContext context, {required String title}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.99,
    height: 46,
    child: DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
// Add Horizontal padding using menuItemStyleData.padding so it matches
// the menu padding when button's width is not specified.
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
          )),
      value: selectedValue1,
      hint: Text(
        title,
        style: TextStyle(
            color: Colors.grey.withOpacity(0.99),
            fontSize: 14,
            fontFamily: Fontfamaly.gilroyMedium),
      ),
      items: genderItems1
          .map((item) => DropdownMenuItem<String>(
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
          return 'Please select status.';
        }
        return null;
      },
      onChanged: (value) {
//Do something when selected item is changed.
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
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    ),
  );
}

communconteinar({required String text,String? text1}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text,
          style: TextStyle(
              color: const Color(0xff1b1b1b),
              fontSize: 15,
              fontFamily: Fontfamaly.gilroyMedium)),
      const SizedBox(
        height: 5,
      ),
      Container(
        height: 46,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.grey.shade300)),
        child: Text(
          "$text1",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontFamily: Fontfamaly.gilroyMedium),
        ),
      ),
    ],
  );
}

class Contact {
  late String name;
  late String number, w1, l1, h1,d1;
  Contact(
      {required this.name,
      required this.number,
      required this.w1,
      required this.l1,
      required this.h1,
      required this.d1,
      });
}

final _formKey = GlobalKey<FormState>();

communbottomsheet({context, Key? formKey, required TextEditingController nam, weight, length, width, height,decleredvalue, void Function()? onTap, onTaps, String? volume,TextEditingController? controller}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15))),
    constraints: const BoxConstraints(maxHeight: 515, minHeight: 515),
// context and builder are
// required properties in this widget
    context: context,
    builder: (context) {
      return Padding(
        padding:  EdgeInsets.only(left: 15, right: 15, top: 8,bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
            height: 700,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 6,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: communtextfiled(
                              title: "Package Name",
                              text: "Name",
                              controller: nam,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter name!';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Flexible(
                            flex: 4,
                            child: communtextfiled(
                                title: "Package Description",
                                text: "Description"),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: communtextfiled(
                                title: "Amount", text: "Amount"),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Flexible(
                            flex: 4,
                            child: communtextfiled(
                              title: "Weight",
                              text: "0",
                              controller: weight,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Weight!';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: communtextfiled(
                              title: "Length",
                              text: "0",
                              controller: length,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Length!';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Flexible(
                            flex: 4,
                            child: communtextfiled(
                              title: "Width",
                              text: "0",
                              controller: width,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Width!';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: communtextfiled(
                              title: "Height",
                              text: "0",
                              controller: height,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter name!';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Flexible(
                            flex: 4,
                            child: communtextfiled(
                                title: "Fixed charge", text: "0"),
                          )
                        ],
                      ),
                      Row(children: [
                        Flexible(
                          flex: 4,
                          child: communtextfiled(
                              title: "Declared value", text: "0",controller: decleredvalue),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Flexible(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Weight vol.",
                                style: TextStyle(
                                    color: const Color(0xff1b1b1b),
                                    fontSize: 15,
                                    fontFamily: Fontfamaly.gilroyMedium,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 46,
                                child: TextField(
                                  controller: controller,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade300,
                                    filled: true,
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    disabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 11),
                            ],
                          ),
                        )
                      ]),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: onTap,
                            // String names = name.text.trim();
                            // String numbers = weight.text.trim();
                            // String widths = width.text.trim();
                            // String lengths = length.text.trim();
                            // String heights = height.text.trim();
                            // if(names.isNotEmpty && numbers.isNotEmpty && widths.isNotEmpty && lengths.isNotEmpty && heights.isNotEmpty){
                            // setState(() {
                            // name.text ="";
                            // weight.text = "";
                            // width.text = "";
                            // length.text = "";
                            // height.text = "";
                            // contacts[selectedIndex].name = names;
                            // contacts[selectedIndex].number = numbers;
                            // contacts[selectedIndex].w1 = widths;
                            // contacts[selectedIndex].l1 = lengths;
                            // contacts[selectedIndex].h1 = heights;
                            // selectedIndex =-1;
                            // });
                            // }
                            // clear();
                            // Get.back();
                            child: Container(
                                height: 40,
                                width: 150,
                                decoration: const BoxDecoration(
                                  color: Color(0xff5c61f2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                    child: Text(
                                  "Update",
                                  style: TextStyle(
                                      fontFamily: Fontfamaly.gilroyMedium,
                                      color: Colors.white),
                                ))),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: onTaps,
                            // if(_formKey.currentState?.validate()??false){
                            // }
                            // String names = name.text.trim();
                            // String numbers = weight.text.trim();
                            // String widths = width.text.trim();
                            // String lengths = length.text.trim();
                            // String heights = height.text.trim();
                            // if(names.isNotEmpty && numbers.isNotEmpty && widths.isNotEmpty && lengths.isNotEmpty && heights.isNotEmpty){
                            // setState(() {
                            // name.text ="";
                            // weight.text = "";
                            // width.text = "";
                            // length.text = "";
                            // height.text = "";
                            // contacts.add(Contact(name: names,number: numbers,w1: widths,l1: lengths,h1: heights,));
                            // });
                            // }
                            // clear();
                            // Get.back();
                            child: Container(
                                height: 40,
                                width: 150,
                                decoration: const BoxDecoration(
                                  color: Color(0xff5c61f2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                    child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontFamily: Fontfamaly.gilroyMedium,
                                      color: Colors.white),
                                ))),
                          ),
                        ],
                      ),
                    ]),
              ),
            )),
      );
    },
  );
}

// ignore: non_constant_identifier_names
phonecallcountry({TextEditingController? Phonecontrol}){
  return SizedBox(
    height: 70,
    child: IntlPhoneField(
      controller: Phonecontrol,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(fontSize: 15,color: Colors.grey,fontFamily: Fontfamaly.gilroyMedium),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffd3d6da)),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffd3d6da)),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff5e59ff)),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {
        if (kDebugMode) {
          print(phone.completeNumber);
        }
      },
    ),
  );
}
