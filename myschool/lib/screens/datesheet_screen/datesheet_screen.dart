
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import 'data/datesheet_data.dart';

class DateSheetScreen extends StatelessWidget {
  const DateSheetScreen({Key? key}) : super(key: key);
  static const String routeName = 'DateSheetScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DateSheet'),
      ),
      body: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius: kTopBorderRadius,
        ),
        child: ListView.builder(
          itemCount: dateSheet.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(
                  left: kDefaultPadding / 2, right: kDefaultPadding / 2),
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 3.h,
                    child: const Divider(
                      thickness: 1.0,
                    ),
                  ),
                  //first need a row, then 3 columns
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //1st column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dateSheet[index].date.toString(),
                            style:
                                Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                          ),
                          Text(dateSheet[index].monthName,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),

                      //2nd one
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dateSheet[index].subjectName,
                            style:
                                Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                          ),
                          Text(dateSheet[index].dayName,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      //3rd one
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '🕒${dateSheet[index].time}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                    child: const Divider(
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
