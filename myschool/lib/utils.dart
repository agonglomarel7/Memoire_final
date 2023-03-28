import 'package:get/get.dart';
import 'package:kkiapay_flutter_sdk/kkiapay/view/widget_builder_view.dart';

void successCallback(response, context) {
  Get.back();
  Get.snackbar("Message", "Un montant de ${response['requestData']['amount']} a été envoyé avec succes. Ref Id: ${response['transactionId']}", snackPosition: SnackPosition.BOTTOM);
  
  
}

const kkiapay = KKiaPay(
  callback: successCallback,
  amount: 2000,
  sandbox: true,
  data: 'Scolarité de votre enfant',
  apikey: '475fbd50c6f411edb0c0797b662748cd',
  phone: "22997000000",
  name: "John Doe",
countries: ["BJ"],
email: "email@mail.com",
  reason: 'Paiement de Scolarité',
    // theme: "#222F5A",
    //partnerId: 'AppId',
    //paymentMethods: ["momo","card"]
);