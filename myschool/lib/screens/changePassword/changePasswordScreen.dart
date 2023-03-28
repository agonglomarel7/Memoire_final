import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myschool/screens/dashboard/dashboard.dart';
import 'package:myschool/screens/signUp_screen/signUp_screen.dart';
import 'package:sizer/sizer.dart';
import '../../constants.dart';
import '../../controllers/authController.dart';
import '../../controllers/studentController.dart';
import '../components/custom_buttons.dart';

late bool _passwordVisible;

class ChangePasswordScreen extends StatefulWidget {
  static String routeName = 'ChangePasswordScreen';

  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordScreen> {
  //validate our form now
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    final AuthController auth = Get.put(AuthController());
    final StudentController studentControler = Get.put(StudentController());
    return GestureDetector(
      //when user taps anywhere on the screen, keyboard hides
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 35.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bienvenue chers Parents',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text('Changer sont mot de passe',
                          style: Theme.of(context).textTheme.titleSmall),
                      sizedBox,
                    ],
                  ),
                  Image.asset(
                    'assets/images/splash.png',
                    height: 20.h,
                    width: 30.w,
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                decoration: BoxDecoration(
                  color: kOtherColor,
                  //reusable radius,
                  borderRadius: kTopBorderRadius,
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Changer son mot de passe",
                        style: TextStyle(color: Colors.black,fontSize: 20),
                      ),
                      sizedBox,
                      buildPasswordField(passwordController),
                      sizedBox,
                      buildPasswordField(passwordController1),
                      sizedBox,
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultButton(
                        onPress: () async {
                          // Map response = await auth.login(data: {
                          //   'mot_de_passe': passwordController1.text
                          // });
                          // if (response['success']) {
                          //   Timer(const Duration(seconds: 5), () async { await studentControler.getStudentByParent(
                          //       id: "1");
                          //   Get.off(() => const dashboard());});
                            
                          // }
                        },
                        title: 'Change Password',
                        iconData: Icons.arrow_forward_outlined,
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  TextFormField buildPasswordField(controller) {
    return TextFormField(
      controller: controller,
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined,
          ),
          iconSize: kDefaultPadding,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Must be more than 5 characters';
        }
        return null;
      },
    );
  }
}
