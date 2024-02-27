import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/AboutUs/bloc/about_us_event.dart';
import 'package:qotoon/Controllers/AboutUs/bloc/about_us_state.dart';
import 'package:qotoon/Shared/Components/custom_app_bar.dart';
import 'package:qotoon/Shared/Components/error_text.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';
import 'package:qotoon/Shared/Components/text_style.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';

import '../../Controllers/AboutUs/bloc/about_us_bloc.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  static const String aboutUsScreenRoute = '/AboutUsScreen';
  @override
  Widget build(BuildContext context) {
    final AboutUsBloc aboutUsBloc = KiwiContainer().resolve<AboutUsBloc>();
    aboutUsBloc.add(AboutUsEventStart(context: context));
    return Scaffold(
      appBar: CustomAppBar(context, 0),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.whoWeAre,
              style: textStyle(size: 24, color: Colors.black),
            ),
            32.verticalSpace,
            BlocBuilder(
              bloc: aboutUsBloc,
              builder: (context, state) {
                return state is AboutUsStateStart
                    ? const Center(child: LoadingWidget())
                    : state is AboutUsStateSuccess
                        ? Text(
                            state.aboutUsModel.data[0].description,
                            style: textStyle(size: 12, color: Colors.black),
                            textAlign: TextAlign.justify,
                          )
                        : const ErrorCenterText();
              },
            )
          ],
        ),
      ),
    );
  }
}
