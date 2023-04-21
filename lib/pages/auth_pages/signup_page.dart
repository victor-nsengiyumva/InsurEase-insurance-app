import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/tools/major_font.dart';

import '../../styles/colors.dart';
import '../../tools/button.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
  
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final TextEditingController _usernameField = TextEditingController();
  final TextEditingController _contactField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Signup',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 60.h),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2.r,
                  blurRadius: 2.r,
                  // changes position of shadow
                ),
              ],
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          // color: Colors.white,
          height: 450.h,
          width: 300.w,

          child: Column(
            children: [
              Padding(
              padding: EdgeInsets.all(20.0.h),
              child: TextField(
                style: TextStyle(color: AppColors.blackColor),
                controller: _usernameField,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   //borderRadius: BorderRadius.circular(60)
                  // ),
                  label: MajorFont(text: 'Name',weight: false,size: 15,)
                  //hintText: 'username',
                  
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(17.0.h),
              child: TextField(
                style: TextStyle(color: AppColors.blackColor),
                controller: _emailField,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   //borderRadius: BorderRadius.circular(60)
                  // ),
                  label: MajorFont(text: 'Email',weight: false,size: 15,)
                  //hintText: 'Email',
                  
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(17.0.h),
              child: TextField(
                style: TextStyle(color: AppColors.blackColor),
                obscureText: true,
                controller: _passwordField,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   //borderRadius: BorderRadius.circular(60)
                  // ),
                  label: MajorFont(text: 'Password',weight: false,size: 15,)
                  
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(17.0.h),
              child: TextField(style: TextStyle(color: AppColors.blackColor),
                controller: _contactField,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   //borderRadius: BorderRadius.circular(60)
                  // ),
                  label: MajorFont(text: 'Contact',weight: false,size: 15,),
                  hintText: 'e.g. 0xxxxxxxxx',
                  
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
                  Container(
                    padding: EdgeInsets.only(top: 38.h),
                    child: Button(text: 'Signup'),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
