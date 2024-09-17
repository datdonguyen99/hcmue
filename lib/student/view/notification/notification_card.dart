import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/public/utils/constant.dart';
import 'package:hcmue/public/utils/font_families.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, this.title, this.content, this.date});

  final title;
  final content;
  final date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Container(
          height: 150.h,
          width: 350.w,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: SizedBox(
                        width: 24.w,
                        height: 30.h,
                        child: const Icon(
                          Icons.notifications_none,
                          size: 35,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    SizedBox(
                      width: 200.w,
                      height: 80.h,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '$title',
                                  style: const TextStyle(
                                    color: darkGray,
                                    fontSize: 22,
                                    fontFamily: OpenSans.regular,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 80.w,
                                height: 30.h,
                                child: Text(
                                  '$content',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: gray,
                                    fontSize: 15,
                                    fontFamily: OpenSans.regular,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100.w,
                  height: 150.h,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 8.w,
                        bottom: 17.h,
                      ),
                      child: Text(
                        '$date',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: gray,
                          fontSize: 12,
                          fontFamily: OpenSans.regular,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
