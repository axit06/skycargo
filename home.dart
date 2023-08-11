import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skycargo/controllers/logincontroller.dart';
import 'package:skycargo/model/fonts.dart';

// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final controller = Get.find<LoginController>();
  List name = [
    "Online Shopping",
    "Shipping",
    "Pickups",
    "Consolidated",
    "Transactions",
    "Users",
    "General Report",
    "Address",
  ];
 List image = [
  "assets/shopping-cart.png",
  "assets/fast-delivery.png",
  "assets/distribution.png",
  "assets/process.png",
  "assets/transaction.png",
  "assets/multiple-users-silhouette.png",
  "assets/multiple-users-silhouette.png",
  "assets/address.png",
];
  List number =[
    '1.325',
    '2.876',
    '\$1.879',
    '1.657',
  ];
  List hname = [
   "New sales",
    "New leads",
    "Income per leads",
    "New then",
  ];
  List icon = [
    "assets/Factory.png",
    "assets/UserGear.png",
    "assets/wallet.png",
    "assets/cost.png",
  ];
  List listname = [
    "Macbook Pro",
    "Macbook Air",
    "Dell Laptop",
    "LG Laptop",
    "Macbook mini",
  ];
  List listsubname = [
    "10-3290-08",
    "10-3456-18",
    "10-3783-63",
    "10-5419-80",
    "10-3290-08",
  ];
  List listprice = [
    "\$118.00",
    "\$208.00",
    "\$578.00",
    "\$1180.00",
    "\$3110.00",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Dashbord",style: TextStyle(fontFamily: Fontfamaly.gilroyBold,color: Colors.black)),
        actions: [
           Row(
             children: [
               Container(
                 height: 40,
                 width: 40,
                 padding: const EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   borderRadius: const BorderRadius.all(Radius.circular(50)),
                   color: Colors.grey.shade100
                 ),
                 child: Image.asset("assets/Bell.png"),
               ),
               const SizedBox(width: 7),
               Container(
                 height: 40,
                 width: 40,
                 padding: const EdgeInsets.all(8),
                 decoration: BoxDecoration(
                     borderRadius: const BorderRadius.all(Radius.circular(50)),
                     color: Colors.grey.shade100
                 ),
                 child: Image.asset("assets/User.png"),
               ),
             ],
           ),
          const SizedBox(width: 7),
        ],
      ),
      body:GetBuilder<LoginController>(
        builder: (controller) {
          return DefaultTabController(length: 3,initialIndex: 0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: SizedBox(
                      height: 190,
                      width: double.infinity,
                      child: ListView.builder(scrollDirection: Axis.horizontal,shrinkWrap: true,itemCount: number.length,itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10,top: 20,bottom: 16),
                          child: Container(
                            height: 100,
                            width: 120,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: Colors.white
                            ),
                            child:
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 21,left: 18),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                                            color: index == 1? const Color(0xfffcf8eb) :
                                            const Color(0xffeef2fc)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(14),
                                          child: Image.asset(icon[index],color: const Color(0xff4e8bf1)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 43),
                                      child: index == 1?Image.asset("assets/ArrowDown.png",color: const Color(0xffe18f8f),width: 20,height: 20,):
                                      Image.asset("assets/ArrowUp.png",color: const Color(0xff90b6f5),width: 20,height: 20,),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 7,),
                                Text(number[index],style: TextStyle(fontFamily: Fontfamaly.gilroyBold,fontSize: 18,),),
                                Text(hname[index],style: TextStyle(fontFamily: Fontfamaly.gilroyMedium,fontSize: 13,color: Colors.grey),)
                              ],
                            ),
                          ),
                        );
                      },),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Latest sales",style: TextStyle(fontFamily: Fontfamaly.gilroyBold,fontSize: 16),),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width*0.78,
                              child: TabBar(
                                indicator: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                    color: Colors.white
                                ),
                                tabs: [
                                  Text("Day",style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: Fontfamaly.gilroyBold),),
                                  Text("Week",style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: Fontfamaly.gilroyBold)),
                                  Text("Month",style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: Fontfamaly.gilroyBold)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  color: Colors.grey.shade100
                              ),
                              child: Image.asset("assets/Calendar.png"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 360,
                          child: TabBarView(children: [
                            daystabview(),
                            daystabview(),
                            daystabview(),
                          ]),
                        ),
                        Image.network("http://13.127.41.199:4000/${controller.daskbordlist[0].registeredPackagesData[0].image}")
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }
  daystabview(){
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: ListView.builder(physics: const NeverScrollableScrollPhysics(),itemCount: listname.length,itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Colors.grey.shade100
            ),
            child: Center(child: Text(listname[index][0])),
          ),
          title: Text(listname[index]),
          subtitle: Text("ID ${listsubname[index]}"),
          trailing: Text(listprice[index]),
        );
      },),
    );
  }
}

class CustomSerchDeleget extends SearchDelegate{
  List<String> searchterm =[
    'Apple',
    'Banana',
    'Pear',
    'Watermelon',
    'Oranges',
    'Blueberries',
    'Strawberries',
    'Raspberries',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(onPressed: (){
      query='';
    }, icon: const Icon(Icons.clear))];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: const Icon(Icons.arrow_back));
  }
  @override
  Widget buildResults(BuildContext context){
    List<String> matchquery =[];
    for(var fruit in searchterm){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchquery.add(fruit);
      }
    }
    return ListView.builder(itemCount: matchquery.length,itemBuilder: (context, index) {
      var result = matchquery[index];
      return ListTile(
        title: Text(result),
      );
    },);
  }
  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchquery =[];
    for(var fruit in searchterm){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchquery.add(fruit);
      }
    }
    return ListView.builder(itemCount: matchquery.length,itemBuilder: (context, index) {
      var result = matchquery[index];
      return ListTile(
        title: Text(result),
      );
    },);
  }
}

// SafeArea(
// child: Scaffold(
// bottomNavigationBar: Padding(
// padding: const EdgeInsets.only(left: 20,right: 20,bottom: 25),
// child:SizedBox()
// ),
// body: SingleChildScrollView(
// child: Column(
// children: [
// Container(
// height: 110,
// width: double.infinity,
// padding: const EdgeInsets.only(left: 20, right: 20, top: 21),
// color: const Color(0xff273040),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "David Sunander",
// style: TextStyle(
// color: Colors.white,
// fontSize: 18,
// fontFamily: Fontfamaly.gilroyBold),
// ),
// Text("Bussiness owner",
// style: TextStyle(
// fontFamily: Fontfamaly.gilroyMedium,
// color: Colors.grey,
// fontSize: 15,
// )),
// ],
// ),
// ),
// Image.asset("assets/BellRinging.png",
// color: Colors.white, height: 30, width: 30)
// ],
// ),
// const SizedBox(
//   height: 40,
// ),
// Row(
//   children: [
//     Container(
//       width: 120,
//       height: 35,
//       decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(6))),
//       child: const Center(
//           child: Text(
//         "Transactions",
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w500),
//       )),
//     ),
//     const SizedBox(
//       width: 10,
//     ),
//     Container(
//       width: 120,
//       height: 35,
//       decoration: BoxDecoration(
//           color: Colors.transparent,
//           borderRadius: const BorderRadius.all(
//             Radius.circular(6),
//           ),
//           border: Border.all(color: Colors.white70)),
//       child: const Center(
//           child: Text(
//         "Product Sales",
//         style: TextStyle(
//             color: Colors.white70,
//             fontSize: 15,
//             fontWeight: FontWeight.w500),
//       )),
//     ),
//   ],
// ),
// const SizedBox(
//   height: 22,
// ),
// const Text(
//   "This month transaction",
//   style: TextStyle(
//       color: Colors.grey,
//       fontSize: 13,
//       fontWeight: FontWeight.w400),
// ),
// Row(
//   children: [
//     const Text(
//       "\$3599.00",
//       style: TextStyle(
//           color: Colors.white,
//           fontSize: 30,
//           fontWeight: FontWeight.w600),
//     ),
//     const Spacer(),
//     Container(
//       height: 30,
//       width: 70,
//       padding: const EdgeInsets.only(left: 4),
//       decoration: BoxDecoration(
//           color: Color(0xff5e59ff),
//           borderRadius: BorderRadius.circular(50)),
//       child: Row(
//         children: [
//           Image.asset("assets/ArrowUp.png",
//               color: Colors.white, height: 20, width: 20),
//           const Text("20%",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400)),
//         ],
//       ),
//     )
//   ],
// )
// ],
// ),
// ),
// Padding(
//   padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
//   child: GridView.builder(
//     itemCount: name.length,
//     shrinkWrap: true,
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         mainAxisSpacing: 15,
//         crossAxisSpacing: 20,
//         mainAxisExtent: 150),
//     itemBuilder: (context, index) {
//       return Column(
//         children: [
//           GestureDetector(
//             onTap: (){
//               Get.to(const OnlineShopping());
//             },
//             child: Container(
//               height: 100,
//               width: 150,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                   color: Colors.grey.withOpacity(0.02),
//                   borderRadius: const BorderRadius.all(Radius.circular(30)),
//                   border: Border.all(color: Colors.grey.shade200)),
//               child: Image.asset(image[index],height: 20,width: 20,color: const Color(0xff273040)),
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Text(name[index],
//               style: TextStyle(fontFamily: Fontfamaly.gilroyMedium),textAlign: TextAlign.center),
//         ],
//       );
//     },
//   ),
// ),
// ],
// ),
// )),
// );