import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pinput/pinput.dart';
import 'package:qotoon/Controllers/Auth/LoginBloc/login_collect_data.dart';
import 'package:qotoon/Controllers/Auth/LoginBloc/login_event.dart';
import 'package:qotoon/Controllers/Auth/LoginBloc/login_state.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';
import 'package:qotoon/Shared/logger.dart';

import '../../Controllers/Auth/LoginBloc/login_bloc.dart';
import '../../Shared/Components/container_button.dart';
import '../../Shared/Components/text_style.dart';
import '../../Shared/Constants/app_colors.dart';
import '../../Shared/Constants/app_strings.dart';
import '../../gen/assets.gen.dart';
import 'text_form_feild.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginCollectData collectData = LoginCollectData();
    final LoginBloc loginBloc = KiwiContainer().resolve<LoginBloc>();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Form(
        key: LoginBloc.formKey,
        // autovalidateMode: AutovalidateMode.,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              38.verticalSpace,

              //*************LOGO ********************
              Hero(
                tag: 'Logo',
                child: Center(
                  child: Assets.images.logo.image(
                      alignment: Alignment.center,
                      width: 111.w,
                      height: 68.h,
                      fit: BoxFit.fill),
                ),
              ),
              69.verticalSpace,
              Text(
                AppStrings.pleaseLogin,
                style: textStyle(size: 20),
              ),
              //********** Phone ***************
              AuthTextField(
                title: AppStrings.phoneNo,
                type: TextFormFeildTypes.numbers,
                controller: LoginBloc.phoneController,
                onSaved: (p0) {
                  collectData.phone = p0;
                },
                validator: (p0) {
                  return p0!.isEmpty ? 'please fill data' : null;
                },
              ),
              16.verticalSpace,
              BlocBuilder(
                bloc: loginBloc,
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      loginBloc.add(LoginCheckPhoneEventStart(
                          context: context,
                          phone: LoginBloc.phoneController.text));
                    },
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        state is LoginCheckPhoneStateStart
                            ? AppStrings.waiting
                            : AppStrings.sendOTP,
                        style: textStyle(
                            isDecorated: true,
                            size: 16,
                            color: AppColors.textFeildFillColor0xffBDBDBD),
                      ),
                    ),
                  );
                },
              ),
              24.verticalSpace,
              SizedBox(
                width: 1.sw,
                child: Pinput(
                  length: 3,
                  onCompleted: (value) {
                    collectData.otp = value;
                    logger.d(collectData.toJson());
                  },
                  validator: (p0) {
                    return p0!.isEmpty ? 'please fill data' : null;
                  },
                  controller: LoginBloc.otpController,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  disabledPinTheme: PinTheme(
                    height: 65.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color:
                            const Color.fromARGB(30, 83, 9, 9).withOpacity(.12),
                        border: Border.all(color: Colors.black12)),
                  ),
                  defaultPinTheme: PinTheme(
                      height: 65.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: const Color.fromARGB(30, 83, 9, 9)
                              .withOpacity(.12),
                          border: Border.all()),
                      textStyle: textStyle()),
                ),
              ),
              190.verticalSpace,
              BlocBuilder(
                bloc: loginBloc,
                builder: (context, state) {
                  return state is LoginStateStart
                      ? const LoadingWidget()
                      : CustomContainerButton(
                          title: AppStrings.enter,
                          width: 1.sw,
                          onPressed: () {
                            collectData.otp = LoginBloc.otpController.text;
                            if (LoginBloc.formKey.currentState!.validate()) {
                              LoginBloc.formKey.currentState!.save();
                              loginBloc.add(LoginEventStart(
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
      ),
    );
  }
}
