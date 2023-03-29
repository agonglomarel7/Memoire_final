import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myschool/constants.dart';

class CustomAlert extends StatelessWidget {
  final bool success;
  final String message;
  const CustomAlert({super.key, required this.message, required this.success});

  @override
  Widget build(BuildContext context) {
    return Dialog(child: Container(
      padding: const EdgeInsets.all(12.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Icon(Icons.sim_card_alert_rounded, color: success? Colors.green : Colors.red,size: 35,),
          Text(message, style: const TextStyle(color: kPrimaryColor, fontSize: 14),textAlign: TextAlign.center,),
          ElevatedButton(onPressed: (){Get.back();}, child: const Text(" OK "))
        ],
      ),
    ),);
  }
}