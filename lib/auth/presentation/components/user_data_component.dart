import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/auth/presentation/controller/login_bloc.dart';
import 'package:tadwer_app/core/global/widget/show_loading_widget.dart';
import 'package:tadwer_app/core/utils/enums.dart';

class UserDataComponent extends StatelessWidget {
  const UserDataComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        switch (state.userInfoState) {
          case RequestState.error:
            return Text(state.errorMessage);
          case RequestState.loading:
            return const ShowLoadingWidget();
          case RequestState.loaded:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "اسم المستخدم",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 1.h),
                Text(
                  state.userInfo.userName,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 3.h),
                Text(
                  "كلمة المرور",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 1.h),
                Text(
                  state.userInfo.password,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 3.h),
                Text(
                  "الموقع",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 1.h),
                Text(
                  "${state.userInfo.city}/${state.userInfo.area}",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            );
        }
      },
    );
  }
}
