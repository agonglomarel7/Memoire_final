
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';

class ParentName extends StatelessWidget {
  const ParentName({Key? key, required this.parentName}) : super(key: key);
  final String parentName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Hi ', style: Theme.of(context).textTheme.subtitle1),
        Text(parentName, style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }
}




class ParentPicture extends StatelessWidget {
  const ParentPicture(
      {Key? key, required this.picAddress, required this.onPress})
      : super(key: key);
  final String picAddress;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
        radius: SizerUtil.deviceType == DeviceType.tablet ? 12.w : 14.w,
        backgroundColor: kSecondaryColor,
        backgroundImage: AssetImage(picAddress),
      ),
    );
  }
}

class ParentDataCard extends StatelessWidget {
  const ParentDataCard(
      {Key? key,
      required this.title,
      required this.value,
      required this.onPress})
      : super(key: key);
  final String title;
  final String value;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 42.w,
        height: 12.h,
        decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: kTextBlackColor,
                  ),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: kTextLightColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
