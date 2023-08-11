import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skycargo/commun.dart';

import 'model/fonts.dart';

class Createprialert extends StatefulWidget {
  const Createprialert({super.key});

  @override
  State<Createprialert> createState() => _CreateprialertState();
}

class _CreateprialertState extends State<Createprialert> {
  selectFile() async {
     image = await picker.pickImage(source: ImageSource.gallery);
     setState(() {
       var image = this.image;
       if(image != null){
         image = XFile(image.path);
     }
     });
  }
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

  XFile? image;

  ImagePicker picker = ImagePicker();

  String? selectedValue1;
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String date="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: backarrow(),
        centerTitle: true,
        title: Text("Create Pre-Alert",style: TextStyle(color: const Color(0xff1b1b1b),fontSize: 19,fontFamily: Fontfamaly.gilroyBold),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 17,right: 20,top: 17),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text("Estimated delivery date",style:TextStyle(color: const Color(0xff1b1b1b),fontSize: 15,fontFamily: Fontfamaly.gilroyMedium)),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                      //get today's date
                        firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != selectedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                        date = pickedDate.toString().split(" ").first;
                      });
                    }
                    if (kDebugMode) {
                      print("-------------------"+pickedDate.toString());
                    }
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.grey.shade300
                      )
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                            width: 45,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                               borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),color: Colors.grey.shade200,),
                            child: Image.asset("assets/CalendarBlank.png",height: 25,width: 25,)),
                        const SizedBox(width: 10),
                        Text(date != ""? date:"DD/MM/YYYY",style: TextStyle(color: Colors.grey.withOpacity(0.99),fontSize: 15,fontFamily: Fontfamaly.gilroyMedium)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text("Courier company",style:TextStyle(color: const Color(0xff1b1b1b),fontSize: 15,fontFamily: Fontfamaly.gilroyMedium)),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.99,
                  height: 46,
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 15),
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
                        )
                    ),
                    hint: Text('Search State', style: TextStyle(color: Colors.grey.withOpacity(0.99),fontSize: 15,fontFamily: Fontfamaly.gilroyMedium),),
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
                ),
                const SizedBox(height: 10),
                Text("# Tracking",style:TextStyle(color: const Color(0xff1b1b1b),fontSize: 15,fontFamily: Fontfamaly.gilroyMedium)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(),
                        hintText: "# Tracking",
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.99),fontFamily: Fontfamaly.gilroyMedium),
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
                const SizedBox(height: 10),
                Text("Store/Supplier",style:TextStyle(color: const Color(0xff1b1b1b),fontSize: 15,fontFamily: Fontfamaly.gilroyMedium)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: const OutlineInputBorder(),
                        hintText: "Store/Supplier",
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.99),fontFamily: Fontfamaly.gilroyMedium),
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
                const SizedBox(height: 10),
                Text("USD Purchase price (\$)",style:TextStyle(color: const Color(0xff1b1b1b),fontSize: 15,fontFamily: Fontfamaly.gilroyMedium)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(),
                        hintText: "Purchase price",
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.99),fontFamily: Fontfamaly.gilroyMedium),
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
                const SizedBox(height: 10),
                Text("Package Description",style:TextStyle(color: const Color(0xff1b1b1b),fontSize: 15,fontFamily: Fontfamaly.gilroyMedium)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(),
                        hintText: "Description",
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.99),fontFamily: Fontfamaly.gilroyMedium),
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
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                    selectFile();
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: Color(0xff4faad5)
                    ),
                    child: Center(child: Text("Upload Image",style: TextStyle(color: Colors.white,fontFamily: Fontfamaly.gilroyMedium),)),
                  ),
                ),
                const SizedBox(height: 6),
                image == null ?
                Image.asset("assets/image_cloud.png",height: 120,width: 120,) :
               Image.file(File(image!.path),width: 120,height: 120,),
                const SizedBox(height: 20),
                communelevated(context,title: "Add Pri-Alert", onPressed: (){}),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
