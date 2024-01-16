import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/address_component/add_address_component.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_app_bar.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class RecyclingRequestScreen extends StatelessWidget {
  const RecyclingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: Image.asset(
                ImagesAssets.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAppBar.appBar(context),
                GestureDetector(
                  onTap: () => showAddAddressDialog(context),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(AppPadding.p16),
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p16),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(AppBorderRadius.s15),
                    ),
                    child: Text(
                      "أضافة الموقع",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(AppPadding.p16),
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p16),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(AppBorderRadius.s15),
                    ),
                    child: Text(
                      "طلب تدوير",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
