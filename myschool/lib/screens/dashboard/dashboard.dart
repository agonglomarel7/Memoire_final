import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myschool/controllers/studentController.dart';
import 'package:myschool/screens/dashboard/widgets/parent_data.dart';
import 'package:myschool/screens/login_screen/login_screen.dart';
import 'package:myschool/suggestions/SuggestionScreen.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

import '../../controllers/authController.dart';
import '../../controllers/evenementController.dart';
import '../../widgets/customAlert.dart';
import '../../widgets/loadingWidget.dart';
import '../changePassword/changePasswordScreen.dart';
import '../children/childrensScreen.dart';
import '../evenements/evenements.dart';
import '../fee_screen/fee_screen.dart';
import '../my_profile/my_profile.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final TextEditingController _identifiantStudentController =
      TextEditingController();

  final authController = Get.find<AuthController>();
  // final studentController = Get.find<StudentController>();
  
    final StudentController studentController =
        Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //we will divide the screen into two parts
          //fixed height for first half
          Container(
            width: 100.w,
            height: 40.h,
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ParentName(
                          parentName:
                              '${authController.user.prenoms} ${authController.user.nom}',
                        ),
                      ],
                    ),
                    kHalfSizedBox,
                    ParentPicture(
                        picAddress: 'assets/images/student_profile.jpeg',
                        onPress: () {
                          // go to profile detail screen here
                          Navigator.pushNamed(
                              context, MyProfileScreen.routeName);
                        }),
                  ],
                ),
                sizedBox,
                FutureBuilder(
                    future: Get.put(StudentController())
                        .getStudentByParent(id: "1"),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting ? const CircularProgressIndicator() : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(
                            () {
                              return ParentDataCard(
                                onPress: () {
                                  //go to attendance screen
                                },
                                title: 'Attendance',
                                value:
                                    '${(studentController.scolarite_total_rest.value * 100) / studentController.scolarite_total_rest.value} %',
                              );
                            }
                          ),
                          ParentDataCard(
                            onPress: () {
                              //go to fee due screen
                              Navigator.pushNamed(context, FeeScreen.routeName);
                            },
                            title: 'Scolarité ',
                            value:
                                '${studentController.scolarite_total_rest.value} XOF',
                          ),
                        ],
                      );
                    })
              ],
            ),
          ),

          //other will use all the remaining height of screen
          Expanded(
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: SingleChildScrollView(
                //for padding
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            //go to assignment screen here
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EvenementScreen()));
                          },
                          icon: 'assets/icons/event.svg',
                          title: 'Activités',
                        ),
                        HomeCard(
                          onPress: () {
                             Get.to(()=>ChildrensScreen());
                          },
                          icon: 'assets/icons/woman-outline.svg',
                          title: 'Mes enfants',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                             Get.to(()=>const FeeScreen());
                          },
                          icon: 'assets/icons/money.svg',
                          title: 'Scolarité',
                        ),
                        HomeCard(
                          onPress: () {
                            Get.to(()=>const SuggestionScreen());

                          },
                          icon: 'assets/icons/ask.svg',
                          title: 'Suggestions',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {Get.to(()=>const ChangePasswordScreen());},
                          icon: 'assets/icons/lock.svg',
                          title: 'Change\nPassword',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()
                            ));
                          },
                          icon: 'assets/icons/logout.svg',
                          title: 'Se deconnecter',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayDialogContext(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _displayDialogContext(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Ajouter un enfant"),
            content: TextField(

              controller: _identifiantStudentController,
              decoration: const InputDecoration(
                  hintText: "Son Matricule",
                labelStyle: TextStyle(color: Colors.red)

              ),
            ),
            actions: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  Get.dialog(const Loading());
                  Get.find<StudentController>().linkStudent(
                      id: AuthController().user.id.toString(),
                      data: {"matricule": _identifiantStudentController.text}).then((value){
                        print(_identifiantStudentController.text);
                          Get.back();
                          CustomAlert(message: value['message'], success: value['success']);
                      });
                },
                child: const Text("Ok"),
              )
            ],
          );
        });
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.onPress,
      required this.icon,
      required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 40.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              width: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
