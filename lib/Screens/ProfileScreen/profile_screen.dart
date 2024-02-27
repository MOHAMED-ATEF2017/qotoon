import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/Auth/ProfileBloc/get_user_bloc.dart';
import 'package:qotoon/Controllers/Auth/ProfileBloc/get_user_event.dart';
import 'package:qotoon/Controllers/Auth/ProfileBloc/get_user_state.dart';
import 'package:qotoon/Controllers/Auth/ProfileBloc/update_profile_collectdata.dart';
import 'package:qotoon/Controllers/Auth/ProfileBloc/update_user_cubit.dart';
import 'package:qotoon/Modules/LoginModules/text_form_feild.dart';
import 'package:qotoon/Shared/Components/container_button.dart';
import 'package:qotoon/Shared/Components/custom_app_bar.dart';
import 'package:qotoon/Shared/Components/error_text.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';
import 'package:qotoon/gen/assets.gen.dart';

import '../../Controllers/Auth/ProfileBloc/update_user_bloc.dart';
import '../../Controllers/Auth/ProfileBloc/update_user_event.dart';
import '../../Controllers/Auth/ProfileBloc/update_user_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String profileScreenRouteName = "/ProfileScreenRoute";

  @override
  Widget build(BuildContext context) {
    final GetUserBloc getUserBloc = KiwiContainer().resolve<GetUserBloc>();
    final UpdateProfileCubit updateUserCubit =
        KiwiContainer().resolve<UpdateProfileCubit>();
    final UpdateProfileBloc updateUserBloc =
        KiwiContainer().resolve<UpdateProfileBloc>();
    getUserBloc.add(GetUserEventStart(context: context));
    UpdateProfileCollectData collectData = UpdateProfileCollectData();
    return Scaffold(
      appBar: CustomAppBar(context, 4),
      body: BlocBuilder(
        bloc: getUserBloc,
        builder: (context, state) {
          return state is GetUserStateStart
              ? const Center(child: LoadingWidget())
              : state is GetUserStateSuccess
                  ? SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Form(
                        key: updateUserCubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            20.verticalSpace,
                            BlocBuilder(
                              bloc: updateUserCubit,
                              builder: (context, _) {
                                return Center(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 100.w,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors
                                                  .ffE0BC66BorderColor),
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: updateUserCubit
                                                        .profileImage ==
                                                    null
                                                ? state.loginData.image == ''
                                                    ? AssetImage(
                                                        Assets.images.logo.path)
                                                    : NetworkImage(state
                                                        .loginData
                                                        .image) as ImageProvider
                                                : FileImage(File(updateUserCubit
                                                    .profileImage!.path)),
                                          ),
                                        ),
                                      ),
                                      PositionedDirectional(
                                          start: -10.w,
                                          bottom: 0,
                                          child: InkWell(
                                            onTap: () {
                                              updateUserCubit
                                                  .changeProfileImage();
                                            },
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.ffE0BC66BorderColor,
                                              child: Icon(
                                                Icons.camera_alt_outlined,
                                                size: 30.r,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              },
                            ),
                            16.verticalSpace,
                            AuthTextField(
                              title: AppStrings.name,
                              initialValue: state.loginData.name,
                              onSaved: (p0) {
                                collectData.name = p0;
                              },
                              validator: (p0) {},
                            ),
                            16.verticalSpace,
                            AuthTextField(
                              title: AppStrings.email,
                              initialValue: state.loginData.email,
                              onSaved: (p0) {
                                collectData.email = p0;
                              },
                              validator: (p0) {},
                            ),
                            16.verticalSpace,
                            AuthTextField(
                              type: TextFormFeildTypes.phone,
                              title: AppStrings.phoneNo,
                              initialValue: state.loginData.phone,
                              onSaved: (p0) {
                                collectData.phone = p0;
                              },
                              validator: (p0) {},
                            ),
                            40.verticalSpace,
                            BlocBuilder(
                              bloc: updateUserBloc,
                              builder: (context, state) {
                                return state is UpdateProfileStateStart
                                    ? const LoadingWidget()
                                    : CustomContainerButton(
                                        title: AppStrings.confirm,
                                        onPressed: () {
                                          if (updateUserCubit
                                              .formKey.currentState!
                                              .validate()) {
                                            updateUserCubit
                                                .formKey.currentState!
                                                .save();
                                            updateUserBloc
                                                .add(UpdateProfileEventStart(
                                              context: context,
                                              collectData: collectData,
                                            ));
                                          }
                                        },
                                      );
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  : const ErrorCenterText();
        },
      ),
    );
  }
}
