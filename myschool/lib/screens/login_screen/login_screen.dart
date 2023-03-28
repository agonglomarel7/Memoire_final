import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myschool/screens/dashboard/dashboard.dart';
import 'package:myschool/screens/signUp_screen/signUp_screen.dart';
import 'package:sizer/sizer.dart';
import '../../constants.dart';
import '../../controllers/authController.dart';
import '../../controllers/studentController.dart';
import '../../widgets/loadingWidget.dart';
import '../changePassword/changePasswordScreen.dart';
import '../components/custom_buttons.dart';

late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //validate our form now
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      Text('Se connecter pour continuer',
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
                        "Connexion",
                        style: TextStyle(color: Colors.black),
                      ),
                      sizedBox,
                      buildEmailField(),
                      sizedBox,
                      buildPasswordField(),
                      sizedBox,
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultButton(
                        onPress: () async {
                          
                  Get.dialog(Loading());
                          Map response = await auth.login(data: {
                            'email': emailController.text,
                            'mot_de_passe': passwordController.text
                          });
                          if (response['success']) {
                            Timer(const Duration(seconds: 5),() async { await studentControler.getStudentByParent(
                                id: "1");
                            Get.off(() => const dashboard());});
                            
                          }
                        },
                        title: 'Connexion',
                        iconData: Icons.arrow_forward_outlined,
                      ),
                      sizedBox,
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangePasswordScreen()));
                          },
                          child: Text(
                            'Mot de passe oublié ?',
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                                text: const TextSpan(
                              text: "Don't have an account ? ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            )),
                            GestureDetector(
                                child: const Text(
                                  "Create ?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen()));
                                })
                          ],
                        ),
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

  TextFormField buildEmailField() {
    return TextFormField(
      controller: emailController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: kInputTextStyle,
      decoration: const InputDecoration(
        labelText: 'Mobile Number/Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        //for validation
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: passwordController,
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
