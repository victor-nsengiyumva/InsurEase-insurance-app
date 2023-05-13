import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insurease/pages/auth_pages/login_page.dart';
import 'package:insurease/tools/major_font.dart';

import '../../authentication/signup.dart';
import '../../styles/colors.dart';
import '../../tools/button.dart';
import '../bottom_nav_pages/navBar.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool loading = false;
  shownotification() {
    Fluttertoast.showToast(
      backgroundColor: AppColors.primeColor,
      textColor: AppColors.whiteColor,
        msg: 'Sign Up Failed',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 4);
  }

  bool passwordvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Sign up',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: AppColors.whiteColor,
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primeColor,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 17.h, left: 17.w),
                    height: 130.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/auth.png'))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h, left: 30.w),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2.r,
                            blurRadius: 2.r,
                            // changes position of shadow
                          ),
                        ],
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    // color: Colors.white,
                    height: 465.h,
                    width: 300.w,

                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0.h),
                          child: TextField(
                            style: TextStyle(color: AppColors.blackColor),
                            controller: _firstname,
                            decoration: InputDecoration(
                                // border: OutlineInputBorder(
                                //   //borderRadius: BorderRadius.circular(60)
                                // ),
                                label: MajorFont(
                              text: 'First Name',
                              weight: false,
                              size: 15,
                            )
                                //hintText: 'username',

                                ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(17.0.h),
                          child: TextField(
                            style: TextStyle(color: AppColors.blackColor),
                            controller: _lastname,
                            decoration: InputDecoration(
                                // border: OutlineInputBorder(
                                //   //borderRadius: BorderRadius.circular(60)
                                // ),
                                label: MajorFont(
                              text: 'Last Name',
                              weight: false,
                              size: 15,
                            )
                                //hintText: 'Email',

                                ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(17.0.h),
                          child: TextField(
                            style: TextStyle(color: AppColors.blackColor),
                            controller: _email,
                            decoration: InputDecoration(
                                // border: OutlineInputBorder(
                                //   //borderRadius: BorderRadius.circular(60)
                                // ),
                                label: MajorFont(
                              text: 'Email',
                              weight: false,
                              size: 15,
                            )),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(17.0.h),
                          child: TextField(
                            obscureText: passwordvisible ? false : true,
                            style: TextStyle(color: AppColors.blackColor),
                            controller: _password,
                            decoration: InputDecoration(
                                // border: OutlineInputBorder(
                                //   //borderRadius: BorderRadius.circular(60)
                                // ),
                                label: MajorFont(
                                  text: 'Password',
                                  weight: false,
                                  size: 15,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    if (passwordvisible == true) {
                                      setState(() {
                                        passwordvisible = false;
                                      });
                                    } else {
                                      setState(() {
                                        passwordvisible = true;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    passwordvisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.primeColor,
                                    size: 15,
                                  ),
                                )),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20.h),
                          child: InkWell(
                              onTap: () async {
                                setState(() {
                                  loading = true;
                                });
                                bool shouldNavigate = await signUp(
                                    
                                    _email.text,
                                    _password.text,_firstname.text,
                                    _lastname.text,);
                                    
                                if (shouldNavigate) {
                                  setState(() {
                                    loading = false;
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                } else {
                                  setState(() {
                                    loading = false;
                                  });
                                  setState(() {
                                    shownotification();
                                  });
                                }
                              },
                              child: Button(text: 'Sign up')),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
