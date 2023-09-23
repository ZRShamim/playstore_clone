import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:playstore_clone/app/playstore/controller/playstor_controller.dart';
import 'package:playstore_clone/routes/routes.dart';
import 'package:playstore_clone/utils/color/custom_colors.dart';
import 'package:playstore_clone/utils/sizes/device_sizes.dart';
import 'package:playstore_clone/utils/text_styles/k_text_styles.dart';

class PlaystorePage extends GetView<PlaystoreController> {
  const PlaystorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.white38,
            ))
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                    controller.cancelInstallApp();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              body: ListView(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            controller.isInstalling.value
                                ? SizedBox(
                                    width: 60.w,
                                    height: 60.w,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: KColors.psPrimaryColor,
                                    ),
                                  )
                                : const SizedBox(),
                            Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(controller.isInstalling.value ? 30.r : 12.r),
                              ),
                              child: AnimatedContainer(
                                margin: EdgeInsets.all(controller.isInstalling.value ? 10.sp : 0),
                                duration: const Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(controller.isInstalling.value ? 30.r : 12.r),
                                  color: Colors.grey[50],
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller.playstoreData.icon,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: DeviceSizes.getDeviceWidth(context) * 0.6,
                              child: Text(
                                controller.playstoreData.title,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              controller.playstoreData.company,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: KColors.psPrimaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: 85.w,
                          // color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.playstoreData.rating,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 10.sp,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                '${controller.playstoreData.reviewsTotal} reviews',
                                style: KTextStyles.psBodyText,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: const VerticalDivider(
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: 85.w,
                          // color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.download_for_offline_outlined,
                                size: 20.sp,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                '${controller.playstoreData.appSize} MB',
                                style: KTextStyles.psBodyText,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: const VerticalDivider(
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: 85.w,
                          // color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                child: Text(
                                  '${controller.playstoreData.ratedFor}+',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Rated for ${controller.playstoreData.ratedFor}+',
                                style: KTextStyles.psBodyText,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: const VerticalDivider(
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: 85.w,
                          // color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${controller.playstoreData.downloadsTotal}+',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Downloads',
                                style: KTextStyles.psBodyText,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
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
                        if (controller.isInstalling.value)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: controller.isInstalling.value ? DeviceSizes.getDeviceWidth(context) * 0.5 - 25.w : null,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                controller.cancelInstallApp();
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: KColors.psPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        if (controller.isInstalling.value)
                          SizedBox(
                            width: 10.w,
                          ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: controller.isInstalling.value ? DeviceSizes.getDeviceWidth(context) * 0.5 - 25.w : DeviceSizes.getDeviceWidth(context) - 40.w,
                          child: controller.isInstalling.value
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    disabledBackgroundColor: Colors.grey[200],
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: null,
                                  child: const Text(
                                    'Open',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: KColors.psPrimaryColor,
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: () {
                                    controller.installApp();
                                  },
                                  child: const Text(
                                    'Install',
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 125.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.playstoreData.images.length,
                      itemBuilder: (context, index) {
                        String image = controller.playstoreData.images[index];
                        return InkWell(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20.w : 5.w,
                              right: index == controller.playstoreData.images.length - 1 ? 20.w : 5.w,
                            ),
                            width: 70.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.5.r),
                              color: Colors.grey[50],
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  image,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'About this app',
                          style: KTextStyles.psHeading,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      controller.playstoreData.description,
                      style: KTextStyles.psBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.playstoreData.tags.length,
                      itemBuilder: (context, index) {
                        String tag = controller.playstoreData.tags[index];
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20.w : 5.w,
                            right: index == 2 ? 20.w : 5.w,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              tag,
                              style: KTextStyles.psBodyText,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Data Safety',
                          style: KTextStyles.psHeading,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Safety starts with understanding how developers collect and share your data. Data privacy and security practices may vary based on your use, region, and age. The developer provided this information and may update it over time.',
                      textAlign: TextAlign.justify,
                      style: KTextStyles.psBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.share_outlined,
                                    size: 18.sp,
                                    color: KColors.psGrey,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    'No data shared with third parties',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: KColors.psGrey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.5.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 35.w,
                                  ),
                                  Text(
                                    'Learn more about how developers declare sharing',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: KColors.psGrey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    size: 18.sp,
                                    color: KColors.psGrey,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    'This app may collect these data types',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: KColors.psGrey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.5.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 35.w,
                                  ),
                                  Text(
                                    'Location, Personal info and 3 others',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: KColors.psGrey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.lock_outlined,
                                    size: 18.sp,
                                    color: KColors.psGrey,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    'Data is encrypted in transit',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: KColors.psGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.delete_outlined,
                                    size: 18.sp,
                                    color: KColors.psGrey,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    'You can request that data be deleted',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: KColors.psGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Rate this app',
                      style: KTextStyles.psHeading,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Tell others what you think',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: KColors.psGrey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: RatingBar(
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
                        Get.toNamed(Routes.ratingPage);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ratingPage);
                      },
                      child: Text(
                        'Write a review',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: KColors.psPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ratings and reviews',
                          style: KTextStyles.psHeading,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Ratings and reviews are verified and are from people who use the same type of device that you use',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: KColors.psGrey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Text(
                          controller.playstoreData.rating,
                          style: TextStyle(
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          children: [
                            const ProgressBar(
                              title: '5',
                              ratingParcentage: 0.55,
                            ),
                            SizedBox(
                              height: 3.5.h,
                            ),
                            const ProgressBar(
                              title: '4',
                              ratingParcentage: 0.13,
                            ),
                            SizedBox(
                              height: 3.5.h,
                            ),
                            const ProgressBar(
                              title: '3',
                              ratingParcentage: 0.07,
                            ),
                            SizedBox(
                              height: 3.5.h,
                            ),
                            const ProgressBar(
                              title: '2',
                              ratingParcentage: 0.03,
                            ),
                            SizedBox(
                              height: 3.5.h,
                            ),
                            const ProgressBar(
                              title: '1',
                              ratingParcentage: 0.32,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.title,
    required this.ratingParcentage,
  });
  final String title;
  final double ratingParcentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 11.sp),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          height: 7.w,
          width: DeviceSizes.getDeviceWidth(context) * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: KColors.psOffWhite,
          ),
          child: Row(
            children: [
              Container(
                // height: 7.w,
                width: DeviceSizes.getDeviceWidth(context) * 0.6 * ratingParcentage,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: KColors.psPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
