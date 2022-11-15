// ignore_for_file: prefer_const_constructors

import 'package:agora_test/src/page/auth/register_page/name_page.dart';
import 'package:flutter/material.dart';

import 'email_page.dart';
import 'gender_page.dart';
import 'guardian_page.dart';
import 'password_page.dart';
import 'phone_number_page.dart';

const registerPageTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);

enum RegisterPageStatus {
  getEmail,
  getPassword,
  getGender,
  getName,
  getGuardian,
  getPhoneNumber,
  
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterPageStatus pageStatus = RegisterPageStatus.getEmail;

  @override
  Widget build(BuildContext context) {
    if (pageStatus == RegisterPageStatus.getEmail) {
      return EmailPage(
        nextPage: namePage,
      );
    } else if (pageStatus == RegisterPageStatus.getName) {
      return NamePage(
        nextPage: phoneNumberPage,
      );
    } else if (pageStatus == RegisterPageStatus.getPhoneNumber) {
      return PhoneNumberPage(
        nextPage: genderPage,
      );
    } else if (pageStatus == RegisterPageStatus.getGender) {
      return GenderPage(
        nextPage: guardianPage,
      );
    } else if (pageStatus == RegisterPageStatus.getGuardian) {
      return GuardianPage(
        nextPage: passwordPage,
      );
    } else if (pageStatus == RegisterPageStatus.getPassword) {
      return PasswordPage(
        nextPage: genderPage,
      );
    } 

    return EmailPage(
      nextPage: passwordPage,
    );
  }

  emailPage() {
    setState(() {
      pageStatus = RegisterPageStatus.getEmail;
    });
  }

  phoneNumberPage() {
    setState(() {
      pageStatus = RegisterPageStatus.getPhoneNumber;
    });
  }

  guardianPage() {
    setState(() {
      pageStatus = RegisterPageStatus.getGuardian;
    });
  }

  genderPage() {
    setState(() {
      pageStatus = RegisterPageStatus.getGender;
    });
  }

  passwordPage() {
    setState(() {
      pageStatus = RegisterPageStatus.getPassword;
    });
  }

  namePage() {
    setState(() {
      pageStatus = RegisterPageStatus.getName;
    });
  }
  
}
