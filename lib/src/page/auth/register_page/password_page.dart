// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/api/auth_controller.dart';
import 'package:agora_test/src/page/auth/register_page/register_complete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key, required this.nextPage}) : super(key: key);
  final Function nextPage;

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {

  final authC= Get.put(AuthController(),permanent: true);
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int flex1 = 2;
    int flex2 = 2;
    int flex3 = 3;
    int flex4 = 1;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFeff3f6),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Spacer(
              flex: flex1,
            ),
            Text(
              "Give a password",
            ),
            Spacer(
              flex: flex1,
            ),
            Image.asset('assets/images/password.png',height: respectiveHeight(size, 200),),
            Spacer(flex: 1,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: authC.password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.lock_outline_rounded,
                      color: Color(0xFFa4a3ef),
                    ),
                  ),
                  hintText: "Your password",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(
                      color: Color(0xFFa4a3ef),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: flex1,
            ),
            Center(
              child: OutlinedButton(
                style: ButtonStyle(
                  foregroundColor: getColor(
                    HexColor('#A092DB'),
                    Color(0xFFeff3f6),
                  ),
                  backgroundColor:
                      getColor(Color(0xFFeff3f6), HexColor('#A092DB')),
                  side: getBorder(HexColor('#89B0FF'), Colors.transparent),
                  shape: MaterialStateProperty.all(StadiumBorder()),
                  fixedSize:
                      MaterialStateProperty.all(Size(size.width * 0.90, 50)),
                ),
                child: Text(
                  "Next",
                ),
                onPressed: () {
                 Get.to(RegisterCompletePage());
                },
              ),
            ),
            Container(),
            SizedBox(
              height: respectiveHeight(size, 50),
            ),
          ],
        ),
      ),
    );
  }
}
