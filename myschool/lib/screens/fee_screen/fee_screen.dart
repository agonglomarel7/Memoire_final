import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../utils.dart';
import 'data/fee_data.dart';
import 'widgets/fee_widgets.dart';

class FeeScreen extends StatelessWidget {
  const FeeScreen({Key? key}) : super(key: key);
  static String routeName = 'FeeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text('Frais de scolarité'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: kTopBorderRadius,
                color: kOtherColor,
              ),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(kDefaultPadding),
                  itemCount: fee.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: kDefaultPadding),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(kDefaultPadding),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: kTextLightColor,
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                FeeDetailRow(
                                  title: 'Receipt No',
                                  statusValue: fee[index].receiptNo,
                                ),
                                const SizedBox(
                                  height: kDefaultPadding,
                                  child: Divider(
                                    thickness: 1.0,
                                  ),
                                ),
                                FeeDetailRow(
                                  title: 'Month',
                                  statusValue: fee[index].month,
                                ),
                                sizedBox,
                                FeeDetailRow(
                                  title: 'Payment Date',
                                  statusValue: fee[index].date,
                                ),
                                sizedBox,
                                FeeDetailRow(
                                  title: 'Status',
                                  statusValue: fee[index].paymentStatus,
                                ),
                                sizedBox,
                                const SizedBox(
                                  height: kDefaultPadding,
                                  child: Divider(
                                    thickness: 1.0,
                                  ),
                                ),
                                FeeDetailRow(
                                  title: 'Total Amount',
                                  statusValue: fee[index].totalAmount,
                                ),
                              ],
                            ),
                          ),
                          FeeButton(
                              title: fee[index].btnStatus,
                              iconData: fee[index].btnStatus == 'Paid'
                                  ? Icons.download_outlined
                                  : Icons.arrow_forward_outlined,
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => kkiapay),
                                );
                              })
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
