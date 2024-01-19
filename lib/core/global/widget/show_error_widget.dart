import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';

class ShowErrorWidget extends StatelessWidget {
  final String errorText;
  const ShowErrorWidget({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Image.asset(
              IconsAssets.errorImage,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            errorText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
