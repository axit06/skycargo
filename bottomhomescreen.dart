import 'package:flutter/material.dart';
import 'package:skycargo/home.dart';
import 'package:skycargo/online_shopping.dart';

class Bottomhomepage extends StatefulWidget {
  const Bottomhomepage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomhomepageState createState() => _BottomhomepageState();
}

class _BottomhomepageState extends State<Bottomhomepage> {
  int pageIndex = 0;

  final pages = [
    const Homescreen(),
    const OnlineShopping(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 15),
        child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                  Colors.grey.shade200,
                  offset: const Offset(
                    3,
                    3,
                  ),
                  blurRadius: 7,
                  spreadRadius: 0,
                ), //BoxShadow
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(
                      0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
            padding:
            const EdgeInsets.only(top: 5,bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? const Icon(
                    Icons.home_rounded,
                    color: Color(0xff7975ff),
                    size: 35,
                  )
                      : const Icon(
                    Icons.home_rounded,
                    color: Colors.black54,
                    size: 35,
                  ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? const Icon(
                    Icons.shopping_cart_outlined,
                    color: Color(0xff7975ff),
                    size: 35,
                  )
                      : const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black54,
                    size: 35,
                  ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? Image.asset("assets/Cube.png",color: Color(0xff7975ff),)
                      : Image.asset("assets/Cube.png",color: Colors.black54,)
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ? const Icon(
                    Icons.local_shipping_outlined,
                    color: Color(0xff7975ff),
                    size: 35,
                  )
                      : const Icon(
                    Icons.local_shipping_outlined,
                    color: Colors.black54,
                    size: 35,
                  ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 4;
                    });
                  },
                  icon: pageIndex == 4
                      ? const Icon(
                    Icons.layers_outlined,
                    color: Color(0xff7975ff),
                    size: 35,
                  )
                      : const Icon(
                    Icons.layers_outlined,
                    color:Colors.black54,
                    size: 35,
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
