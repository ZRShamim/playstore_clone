import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:playstore_clone/app/playstore/controller/playstor_controller.dart';
import 'package:playstore_clone/utils/color/custom_colors.dart';
import 'package:playstore_clone/utils/sizes/device_sizes.dart';
import 'package:playstore_clone/utils/text_styles/k_text_styles.dart';

class RatingPage extends GetView<PlaystoreController> {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        discardDialog(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  surfaceTintColor: Colors.white,
                  title: Text(
                    'Discard Draft?',
                    style: KTextStyles.psHeading,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text(
                        'Keep',
                        style: TextStyle(color: KColors.psPrimaryColor),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        Navigator.of(context).pop(true);
                        controller.rating.value = 0;
                        controller.commentTextController.text = '';
                      },
                      child: const Text(
                        'Discard',
                        style: TextStyle(color: KColors.psPrimaryColor),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          leadingWidth: 25.w,
          title: Row(
            children: [
              Container(
                width: 25.w,
                height: 25.w,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(5.r),
                  image: DecorationImage(
                    image: NetworkImage(controller.playstoreData.icon),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: DeviceSizes.getDeviceWidth(context) * 0.50.w,
                    child: Text(
                      controller.playstoreData.title,
                      style: KTextStyles.psHeading,
                    ),
                  ),
                  Text(
                    'Rate this app',
                    style: KTextStyles.psBodyText,
                  ),
                ],
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Post',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: KColors.psPrimaryColor,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[50],
                    radius: 20.r,
                    foregroundImage: const NetworkImage(
                      'https://parade.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTk3MTU5ODE0NzEzODQ1MDU1/morgan-freeman-copy.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Morgan Freeman',
                        style: KTextStyles.psHeading,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width:
                            DeviceSizes.getDeviceWidth(context) * .7.w - 40.w,
                        child: Text(
                          'Reviews are public and includeyour account and device info.',
                          style: KTextStyles.psBodyText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.r,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  RatingBar(
                    wrapAlignment: WrapAlignment.spaceEvenly,
                    initialRating: controller.rating.value.toDouble(),
                    maxRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    unratedColor: KColors.psGrey,
                    itemCount: 5,
                    itemSize: 30.sp,
                    tapOnlyMode: true,
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: KColors.psPrimaryColor,
                      ),
                      half: const Icon(
                        Icons.star_half,
                        color: KColors.psPrimaryColor,
                      ),
                      empty: const Icon(
                        Icons.star_border,
                        color: KColors.psGrey,
                      ),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      controller.rating.value = rating.toInt();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFormField(
                controller: controller.commentTextController,
                keyboardType: TextInputType.multiline,
                maxLength: 500,
                maxLines: null,
                style: KTextStyles.psHeading,
                cursorColor: KColors.psPrimaryColor,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: 'Describe your experience',
                  hintStyle: TextStyle(
                    fontSize: 11.sp,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: KColors.psPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> discardDialog(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Discard Draft?',
              style: KTextStyles.psHeading,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'Keep',
                  style: TextStyle(color: KColors.psPrimaryColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  controller.rating.value = 0;
                  controller.commentTextController.text = '';
                },
                child: const Text(
                  'Discard',
                  style: TextStyle(color: KColors.psPrimaryColor),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}
