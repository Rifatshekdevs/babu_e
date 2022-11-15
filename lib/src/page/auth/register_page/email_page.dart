// ignore_for_file: prefer_const_constructors, unused_local_variable


import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/api/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class EmailPage extends StatefulWidget {
  final Function nextPage;
  const EmailPage({Key? key, required this.nextPage}) : super(key: key);

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> with BaseController {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              // Spacer(
              //   flex: flex1,
              // ),
              Text(
                "What's your email?",
              ),
              // Spacer(
              //   flex: flex1,
              // ),
              Image.asset(
                'assets/images/mail.png',
                height: respectiveHeight(size, 200),
              ),
              // Spacer(
              //   flex: flex1,
              // ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: authC.email,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.email_outlined,
                        color: Color(0xFFa4a3ef),
                      ),
                    ),
                    hintText: "Your Email",
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
                  validator: (email) {
                    String p =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(p);
                    if (!regExp.hasMatch(email!))
                      return 'Please provide a valid email address with @.';
                    return null;
                  },
                ),
              ),
              // Spacer(
              //   flex: flex3,
              // ),
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
                    if (_formKey.currentState!.validate()) {
                      widget.nextPage();
                    }
                  },
                ),
              ),
              SizedBox(
                height: respectiveHeight(size, 50),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
