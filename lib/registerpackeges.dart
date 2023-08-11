import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skycargo/addsender.dart';
import 'commun.dart';
import 'model/fonts.dart';
import 'package:get/get.dart';

class Registerpackeges extends StatefulWidget {
  const Registerpackeges({super.key});

  @override
  State<Registerpackeges> createState() => _RegisterpackegesState();
}

class _RegisterpackegesState extends State<Registerpackeges> {
  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  List price = [
    "10x5x3",
    "11x3x4",
    "13x5x5",
    "6x6x4",
    "8x7x3",
    "9x4x7",
    "13x1x5",
    "15x2x6",
    "16x6x1",
    "12x4x5",
  ];

  // ignore: non_constant_identifier_names
  List Purchese = [
    "Box",
    "sox",
    "dox",
    "fox",
    "cox",
    "mox",
    "tox",
    "aox",
    "nox",
    "gox",
  ];

  List number = [
    "10",
    "10",
    "11",
    "13",
    "6",
    "8",
    "9",
    "13",
    "15",
    "16",
    "12",
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

  List packagename = [
    "Subtotal",
    "Discount",
    "Shipping insurance",
    "Customs Duties",
    "Tax",
    "Declared value",
    "Fixed charge",
    "Reissue",
    "Total",
  ];

  List<Contact> contacts = List.empty(growable: true);

  TextEditingController name = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController declaredvalue = TextEditingController();
  TextEditingController resultController = TextEditingController();

  void calculateResult() {
    double num1 = double.tryParse(length.text) ?? 0;
    double num2 = double.tryParse(width.text) ?? 0;
    double num3 = double.tryParse(height.text) ?? 0;
    double result = (num1 * num2 * num3) / 5000;
    resultController.text = result.toStringAsFixed(2); // Display result up to 2 decimal places
  }
  int totalweight=0;

  void calculateweighttotal(){
    for(int a = 0 ; a<contacts.length;a++){
       totalweight += int.parse(contacts[a].number);
    }
  }

  int selectedIndex = -1;

  selectFile() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      var image = this.image;
      if (image != null) {
        image = XFile(image.path);
      }
    });
  }

  XFile? image;

  ImagePicker picker = ImagePicker();
  PageController scrollController = PageController();

  var form = [];
  int change = 0;
  late int volume;
  @override
  void initState() {
    form = [];
    length.addListener(calculateResult);
    width.addListener(calculateResult);
    height.addListener(calculateResult);
    setState(() {
      form.add(0);
    });
     volume =0;
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    length.dispose();
    width.dispose();
    height.dispose();
    resultController.dispose();
    super.dispose();
  }

  clear() {
    setState(() {
      name.text = "";
      width.text = "";
      weight.text = "";
      length.text = "";
      height.text = "";
      declaredvalue.text = "";
    });
  }

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
              onTap: () {
                if (change == 5) {
                  setState(() {
                    scrollController.jumpToPage(4);
                    form.remove(5);
                  });
                } else if (change == 4) {
                  setState(() {
                    scrollController.jumpToPage(3);
                    form.remove(4);
                    totalweight = 0;
                  });
                } else if (change == 3) {
                  setState(() {
                    scrollController.jumpToPage(2);
                    form.remove(3);
                  });
                } else if (change == 2) {
                  setState(() {
                    scrollController.jumpToPage(1);
                    form.remove(2);
                  });
                } else if (change == 1) {
                  setState(() {
                    scrollController.jumpToPage(0);
                    form.remove(1);
                  });
                }
              },
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
                onTap: () {
                  if (change == 0) {
                    setState(() {
                      scrollController.jumpToPage(1);
                      form.add(1);
                    });
                  } else if (change == 1) {
                    setState(() {
                      scrollController.jumpToPage(2);
                      form.add(2);
                    });
                  } else if (change == 2) {
                    setState(() {
                      scrollController.jumpToPage(3);
                      form.add(3);
                    });
                  } else if (change == 3) {
                    setState(() {
                      scrollController.jumpToPage(4);
                      calculateweighttotal();
                      form.add(4);
                    });
                  } else if (change == 4) {
                    setState(() {
                      scrollController.jumpToPage(5);
                      form.add(5);
                    });
                  }
                },
                child: change == 5
                    ? InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
                      constraints: const BoxConstraints(maxHeight: 235, minHeight: 235),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding:  const EdgeInsets.only(left: 15, right: 15, top: 8),
                          child: SizedBox(
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.green,
                                    child: Image.asset("assets/Check.png",color: Colors.white),
                                  ),
                                  Text("Congratulations!",style: TextStyle(fontFamily: Fontfamaly.gilroyBold),),
                                  Text("Costomer has been successfully added.",style: TextStyle(fontFamily: Fontfamaly.gilroyMedium,fontSize: 15,color: Colors.grey),),
                                 communelevated(context, title: "Sign in",onPressed: (){})
                                ],
                              ),
                          ),
                        );
                      },
                    );
                  },
                      child: Container(
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
                          ))),
                    )
                    : Container(
                        height: 40,
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Color(0xff5c61f2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                            child: Text(
                          "Next",
                          style: TextStyle(
                              fontFamily: Fontfamaly.gilroyMedium,
                              color: Colors.white),
                        )))),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: backarrow(),
        centerTitle: true,
        title: Text(
          change == 0
              ? "Tracking Information"
              : change == 1
                  ? "Sender Information"
                  : change == 2
                      ? "Shipping Information"
                      : change == 3
                          ? "Package Information"
                          : change == 4
                              ? "Package title Information"
                              : "Package Detailer Information",
          style: TextStyle(
              color: const Color(0xff1b1b1b),
              fontSize: 16,
              fontFamily: Fontfamaly.gilroyBold),
        ),
        actions: [
          change == 1
              ? Row(
                  children: [
                    Container(
                      height: 35,
                      width: 75,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0xff5e59ff)),
                      child: InkWell(
                          onTap: () {
                            Get.to(const Addsender());
                          },
                          child: Center(
                              child: Text(
                            "Add sender",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: Fontfamaly.gilroyMedium),
                          ))),
                    ),
                  ],
                )
              : change == 3
                  ? Row(
                      children: [
                        Container(
                          height: 35,
                          width: 65,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Color(0xff5e59ff)),
                          child: InkWell(
                              onTap: () {
                                communbottomsheet(
                                  controller: resultController,
                                  volume: "$volume",
                                    context: context,
                                    formKey: _formKey,
                                    nam: name,
                                    height: height,
                                    width: width,
                                    length: length,
                                    weight: weight,
                                    decleredvalue: declaredvalue,
                                    onTaps: () {
                                      if (_formKey.currentState!.validate()) {
                                        String names = name.text.trim();
                                        String numbers = weight.text.trim();
                                        String widths = width.text.trim();
                                        String lengths = length.text.trim();
                                        String heights = height.text.trim();
                                        String declar = declaredvalue.text.trim();
                                        setState(() {
                                          contacts.add(Contact(
                                            name: names,
                                            number: numbers,
                                            w1: widths,
                                            l1: lengths,
                                            h1: heights,
                                            d1: declar,
                                          ));
                                        });
                                        // clear();
                                        Get.back();
                                      }
                                    });
                              },
                              child: Center(
                                  child: Text(
                                "Add box",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: Fontfamaly.gilroyMedium),
                              ))),
                        ),
                      ],
                    )
                  : const SizedBox(),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 9, right: 9),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: form.contains(index)
                                      ? const Color(0xff5c61f2)
                                      : Colors.white,
                                  shape: BoxShape.circle,
                                  border: form.contains(index)
                                      ? Border.all(
                                          color: const Color(0xff5c61f2))
                                      : Border.all(color: Colors.grey)),
                              child: Center(
                                  child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                    color: form.contains(index)
                                        ? Colors.white
                                        : Colors.black,
                                    fontFamily: Fontfamaly.gilroyMedium),
                              )),
                            ),
                          ),
                          index != 5
                              ? const SizedBox(
                                  width: 18,
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: change == 0
                      ? 400
                      : change == 1
                          ? 250
                          : change == 2
                              ? 1030
                              : change == 3
                                  ? 500
                                  : change == 4
                                      ? 950
                                      : 500,
                  child: PageView.builder(
                    controller: scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    onPageChanged: (value) {
                      setState(() {
                        change = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return index == 0
                          ? registerpackage()
                          : index == 1
                              ? senderinformetion()
                              : index == 2
                                  ? shippinginformetion()
                                  : index == 3
                                      ? packageinformation()
                                      : index == 4
                                          ? packageinfo1()
                                          : packageinfo2();
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  registerpackage() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(
              0.3,
              0.3,
            ),
            blurRadius: 0.3,
            spreadRadius: 0.3,
          ), //BoxShadow
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text("Shipping Prefix",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(height: 6),
          Container(
            height: 45,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.grey.shade300)),
            child: Text(
              "WIL",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          communtextfiled(title: "Tracking ID", text: "000018"),
          const SizedBox(
            height: 10,
          ),
          Text("List of Agencies",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(
            height: 10,
          ),
          dropdowen(context, title: "Search Agencies"),
          const SizedBox(
            height: 10,
          ),
          Text("Office of origin",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(
            height: 10,
          ),
          dropdowen(context, title: "Search Office"),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  senderinformetion() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text("Sender/Costumer",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(
            height: 10,
          ),
          dropdowen(context, title: "Search Sender/Costumer"),
          const SizedBox(
            height: 25,
          ),
          Text("Sender/Costumer Address",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(
            height: 10,
          ),
          dropdowen(context, title: "Search Sender/Costumer Address"),
        ],
      ),
    );
  }

  shippinginformetion() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text("# Tracking",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(height: 10),
          SizedBox(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(),
                  hintText: "# Tracking",
                  hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.99),
                      fontFamily: Fontfamaly.gilroyMedium),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff5e59ff)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3d6da)),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          const SizedBox(height: 10),
          Text("Store/Supplier",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(height: 10),
          SizedBox(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(),
                  hintText: "Store/Supplier",
                  hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.99),
                      fontFamily: Fontfamaly.gilroyMedium),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff5e59ff)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3d6da)),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          const SizedBox(height: 10),
          Text("USD Purchase price (\$)",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(height: 10),
          SizedBox(
            height: 45,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(),
                  hintText: "Purchase price",
                  hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.99),
                      fontFamily: Fontfamaly.gilroyMedium),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff5e59ff)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3d6da)),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Shipping mode",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(
            height: 10,
          ),
          dropdowen(context, title: "Search Shipping Mode"),
          const SizedBox(
            height: 25,
          ),
          Text("Type of packaging",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(
            height: 10,
          ),
          dropdowen(context, title: "Search packaging"),
          const SizedBox(
            height: 10,
          ),
          Text("Courier company",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(
            height: 10,
          ),
          dropdowen(context, title: "Search company"),
          const SizedBox(
            height: 25,
          ),
          Text("Service mode",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(
            height: 10,
          ),
          dropdowen(context, title: "Search mode"),
          const SizedBox(
            height: 10,
          ),
          Text("Delivery time",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(
            height: 10,
          ),
          dropdowen(context, title: "Search time"),
          const SizedBox(
            height: 25,
          ),
          Text("Assign Driver",
              style: TextStyle(
                  color: const Color(0xff1b1b1b),
                  fontSize: 15,
                  fontFamily: Fontfamaly.gilroyMedium)),
          const SizedBox(
            height: 10,
          ),
          dropdowen(context, title: "Search Driver"),
          const SizedBox(
            height: 17,
          ),
          InkWell(
            onTap: () {
              selectFile();
            },
            child: Container(
              height: 40,
              width: 120,
              decoration: const BoxDecoration(color: Color(0xff4faad5)),
              child: Center(
                  child: Text(
                "Upload Image",
                style: TextStyle(
                    color: Colors.white, fontFamily: Fontfamaly.gilroyMedium),
              )),
            ),
          ),
          const SizedBox(height: 6),
          image == null
              ? Image.asset(
                  "assets/image_cloud.png",
                  height: 120,
                  width: 120,
                )
              : Image.file(
                  File(image!.path),
                  width: 120,
                  height: 120,
                ),
        ],
      ),
    );
  }

  packageinformation() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            contacts.isEmpty
                ? Center(child: Image.asset("assets/12445722_4962879.jpg"))
                : Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: contacts.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text("Package Name",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily:
                                                Fontfamaly.gilroyMedium))),
                                Text(contacts[index].name,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: Fontfamaly.gilroyMedium)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                    child: Text("Weight",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily:
                                                Fontfamaly.gilroyMedium))),
                                Text(contacts[index].number,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: Fontfamaly.gilroyMedium)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                    child: Text("WxLxH",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily:
                                                Fontfamaly.gilroyMedium))),
                                Text(
                                    "${contacts[index].w1}x${contacts[index].l1}x${contacts[index].h1} ",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: Fontfamaly.gilroyMedium)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    communbottomsheet(
                                      controller: resultController,
                                        context: context,
                                        formKey: _formKey,
                                        nam: name,
                                        height: height,
                                        width: width,
                                        length: length,
                                        weight: weight,
                                        onTap: () {
                                          String names = name.text.trim();
                                          String numbers = weight.text.trim();
                                          String widths = width.text.trim();
                                          String lengths = length.text.trim();
                                          String heights = height.text.trim();
                                          if (names.isNotEmpty &&
                                              numbers.isNotEmpty &&
                                              widths.isNotEmpty &&
                                              lengths.isNotEmpty &&
                                              heights.isNotEmpty) {
                                            setState(() {
                                              name.text = "";
                                              weight.text = "";
                                              width.text = "";
                                              length.text = "";
                                              height.text = "";
                                              contacts[selectedIndex].name = names;
                                              contacts[selectedIndex].number = numbers;
                                              contacts[selectedIndex].w1 = widths;
                                              contacts[selectedIndex].l1 = lengths;
                                              contacts[selectedIndex].h1 = heights;
                                              selectedIndex = -1;
                                            });
                                          }
                                          Get.back();
                                        },
                                      );
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(color: Colors.grey)),
                                    child: Center(
                                        child: Text(
                                      "Edit Price",
                                      style: TextStyle(
                                        fontSize: 12,
                                          color: Colors.black54,
                                          fontFamily: Fontfamaly.gilroyMedium),
                                    )),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      contacts.removeAt(index);
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
                            const Divider(
                              thickness: 1,
                            ),
                          ],
                        );
                      },
                    ),
                  )
          ],
        ));
  }

  packageinfo1() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          communconteinar(text: "Total Weight",text1: "$totalweight"),
          const SizedBox(
            height: 10,
          ),
          communconteinar(text: "Total Weight vol.",text1: "0"),
          const SizedBox(
            height: 10,
          ),
          communconteinar(text: "Total Declared value",text1: "0"),
          const SizedBox(
            height: 5,
          ),
          communtextfiled(title: "Price kg", text: "1"),
          communtextfiled(title: "Discount (%)", text: "0"),
          communtextfiled(title: "Value assured", text: "0"),
          communtextfiled(title: "Shipping insurance", text: "0"),
          communtextfiled(title: "Customer Duties", text: "0"),
          communtextfiled(title: "Tax (%)", text: "19"),
          communtextfiled(title: "Declared value", text: "0"),
          communtextfiled(title: "Reissue", text: "0")
        ],
      ),
    );
  }

  packageinfo2() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Text(packagename[index]),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 135,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey.shade300),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 35,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                color: Colors.black),
                            child: Center(
                                child: Text(
                              "\$",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: Fontfamaly.gilroyMedium),
                            )),
                          ),
                          const SizedBox(width: 10),
                          Text("0.00",
                              style: TextStyle(fontSize: 15,fontFamily: Fontfamaly.gilroyMedium))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          },
        ));
  }
}
