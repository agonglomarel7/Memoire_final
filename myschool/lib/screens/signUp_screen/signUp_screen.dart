import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myschool/screens/login_screen/login_screen.dart';
import 'package:sizer/sizer.dart';
import '../../constants.dart';
import '../../controllers/authController.dart';
import '../../widgets/customAlert.dart';
import '../../widgets/loadingWidget.dart';
import '../components/custom_buttons.dart';

late bool _passwordVisible;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static String RouteName = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
//validate our form now
  final _formKey = GlobalKey<FormState>();

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  bool _secureText = true;
  String groupValue = 'M';

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    final AuthController auth = Get.put(AuthController());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 20.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bienvenue chers Parents',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text('S\'inscrire pour continuer',
                          style: Theme.of(context).textTheme.titleSmall),
                      sizedBox,
                    ],
                  ),
                  Image.asset(
                    'assets/images/splash.png',
                    height: 15.h,
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
                            height: 5,
                          ),
                          const Text(
                            "Inscription",
                            style: TextStyle(color: Colors.black),
                          ),
                          sizedBox,
                          buildNameField(),
                          buildPrenomField(),
                          buildEmailField(),
                          buildPhoneField(),
                          buildPasswordField(),
                          buildConfirmPasswordField(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Radio(
                                  value: 'M',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value!;
                                    });
                                  }),
                              const Text(
                                "Masculin",
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                              Radio(
                                  value: 'F',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value!;
                                    });
                                  }),
                              const Text(
                                "Féminin",
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              )
                            ],
                          ),
                          const SizedBox(height: 25),
                          sizedBox,
                          DefaultButton(
                            onPress: () async {
                              print("xxx xxxx xxxx xx xx xx ");
                              if (_formKey.currentState!.validate()) {
                                Get.dialog(const Loading());
                                var response = await auth.signUp(data: {
                                  "nom": nomController.text,
                                  "prenoms": prenomController.text,
                                  "email": emailController.text,
                                  "tel": phoneController.text,
                                  "sexe": groupValue,
                                  "mot_de_passe": password1Controller.text
                                });
                                if (response['success']) {
                                  Get.snackbar("Message", response['message'],
                                      duration: const Duration(seconds: 5),
                                      snackPosition: SnackPosition.BOTTOM);
                                  Get.to(() => const LoginScreen());
                                } else {
                                  Get.back();
                                  CustomAlert(
                                      success: response['success'],
                                      message: response['message']);
                                }
                              }
                            },
                            title: 'Inscription',
                            iconData: Icons.arrow_forward_outlined,
                          ),
                          sizedBox,
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                  text: const TextSpan(
                                    text: "Already have an account ? ",
                                    style: TextStyle(color: Colors.grey, fontSize: 20),
                                  )),
                              GestureDetector(
                                  child: const Text(
                                    "Login",
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
                                            const LoginScreen()));
                                  })
                            ],
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

  TextFormField buildNameField() {
    return TextFormField(
      controller: nomController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      style: kInputTextStyle,
      decoration: const InputDecoration(
        labelText: 'Nom',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        //for validation
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  TextFormField buildPrenomField() {
    return TextFormField(
      controller: prenomController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      style: kInputTextStyle,
      decoration: const InputDecoration(
        labelText: 'Prénom',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        //for validation
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
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

  TextFormField buildPhoneField() {
    return TextFormField(
      controller: phoneController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      style: kInputTextStyle,
      decoration: const InputDecoration(
        labelText: 'Téléphone',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        //for validation
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: password1Controller,
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
            _passwordVisible ? Icons.visibility_off_outlined : Icons.visibility,
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

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
      controller: password2Controller,
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'ConfirmPassword',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible ? Icons.visibility_off_outlined : Icons.visibility,
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
