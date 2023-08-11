import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycargo/create_your_account.dart';
import 'package:skycargo/model/fonts.dart';
import 'package:skycargo/rider_create_account.dart';

import 'commun.dart';
import 'controllers/logincontroller.dart';

// ignore: camel_case_types
class Sing_up_pos extends StatefulWidget {
  const Sing_up_pos({super.key});

  @override
  State<Sing_up_pos> createState() => _Sing_up_posState();
}

// ignore: camel_case_types
class _Sing_up_posState extends State<Sing_up_pos> {
  bool submit = false;
  bool btm = false;

  bool passwordVisible = true;
  bool value = false;
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backarrow(),
                const SizedBox(height: 20),
                Text("Sign up POS account",
                    style: TextStyle(
                        color: const Color(0xff1b1b1b),
                        fontSize: 23,
                        fontFamily: Fontfamaly.gilroyBold)),
                Text("Welcome! Please register your account.",style: TextStyle(color: Colors.grey,fontFamily: Fontfamaly.gilroyMedium)),
                const SizedBox(height: 22),
                Text(
                  "Phone number or Email",
                  style: TextStyle(fontSize: 16, fontFamily: Fontfamaly.gilroyMedium),
                ),
                const SizedBox(height: 5),
                TextField(
                  onChanged: (value) => _loginController.email.value = value,
                  onSubmitted: button(),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      border: const OutlineInputBorder(),
                      hintText: 'ex.yourname@gmail.com',
                      hintStyle: TextStyle(fontSize: 15,fontFamily: Fontfamaly.gilroyMedium,color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xff5e59ff)),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffd3d6da)),
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset("assets/EnvelopeSimple.png",height: 10,width: 10),
                      )),
                ),
                const SizedBox(height: 15),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontFamily: Fontfamaly.gilroyMedium),
                ),
                const SizedBox(height: 5),
                TextField(
                  obscureText: passwordVisible,
                  onChanged: (value) => _loginController.password.value = value,
                  onSubmitted: button(),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    border: const OutlineInputBorder(),
                    hintText: 'Type your password here',
                    hintStyle: TextStyle(fontSize: 15,fontFamily: Fontfamaly.gilroyMedium,color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff5e59ff)),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffd3d6da)),
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(
                              () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: passwordVisible
                            ? Image.asset(
                          "assets/EyeSlash.png",height: 9,width: 9,
                          color: Colors.black87,
                        )
                            : Image.asset("assets/eye.png",height: 9,width: 9,
                            color: Colors.black87),
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Image.asset(
                          "assets/Key.png",
                          color: Colors.black87,
                          height: 10,width: 10
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: value,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    const Text("Remember me"),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(color: Color(0xff5e59ff)),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                
                ElevatedButton(
                  onPressed: () {
                    _loginController.login();
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize:
                      Size(MediaQuery.of(context).size.width * 0.99, 50),
                      backgroundColor: btm ? Colors.grey.shade200:const Color(0xff5e59ff),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)))),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: btm ? Colors.grey : Colors.white,
                        fontFamily: Fontfamaly.gilroyBold,
                        fontSize: 19),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text("OR"),
                  Expanded(child: Divider()),
                ]),
                const SizedBox(height: 17),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.99,
                  child: OutlinedButton(
                      onPressed: () {
                        Get.to(const Rider_create_account());
                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xff5e59ff)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      child: Text(
                        "Sign up with Rider",
                        style:
                        TextStyle(color: const Color(0xff5e59ff), fontSize: 18,fontFamily: Fontfamaly.gilroyBold),
                      )),
                ),
                const SizedBox(height: 11),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(const Create_your_account());
                    },
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                color: const Color(0xff1b1b1b),
                                fontFamily: Fontfamaly.gilroyMedium,
                                fontSize: 17)),
                        TextSpan(
                            text: "Sign up",
                            style: TextStyle(
                                color: const Color(0xff5e59ff),
                                fontSize: 17,
                                fontFamily: Fontfamaly.gilroyMedium)),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
  button(){
    print("00000000000000000");
    if(_loginController.email.isEmpty &&
        _loginController.password.isEmpty){
      setState(() {
        btm = true;
      });
    }
    else{
      setState(() {
        btm = false;
      });
    }
  }
}
