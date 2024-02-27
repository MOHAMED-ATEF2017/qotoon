import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:photo_view/photo_view.dart';
import 'package:qotoon/Controllers/InvestWithUsControllers/InvestBloc/invest_bloc.dart';
import 'package:qotoon/Controllers/InvestWithUsControllers/InvestBloc/invest_collectdata.dart';
import 'package:qotoon/Controllers/InvestWithUsControllers/InvestBloc/invest_event.dart';
import 'package:qotoon/Controllers/InvestWithUsControllers/cubit/invest_cubit.dart';
import 'package:qotoon/Modules/LoginModules/text_form_feild.dart';
import 'package:qotoon/Shared/Components/container_button.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';

import '../../Controllers/InvestWithUsControllers/InvestBloc/invest_state.dart';
import '../../Shared/Components/custom_app_bar.dart';
import '../../Shared/Components/text_style.dart';
import '../../Shared/Constants/app_colors.dart';

class InvestWithUsScreen extends StatelessWidget {
  const InvestWithUsScreen({super.key});
  static const String investWithUsScreenRoute = '/ProfileScreen';
  @override
  Widget build(BuildContext context) {
    final InvestBloc investBloc = KiwiContainer().resolve<InvestBloc>();
    investBloc.add(AreasEventStart(context: context));
    final GlobalKey<FormState> formKey = GlobalKey();
    InvestCollectData collectData = InvestCollectData();
    return Scaffold(
      appBar: CustomAppBar(context, 4),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTextField(
                title: AppStrings.aqarName,
                onSaved: (p0) {
                  collectData.name = p0;
                },
                validator: (p0) {
                  return p0!.isEmpty ? AppStrings.pleaseFillData : null;
                },
              ),
              16.verticalSpace,
              Text(
                AppStrings.aqarLocation,
                style:
                    textStyle(size: 16, color: Colors.black.withOpacity(.26)),
              ),
              16.verticalSpace,
              BlocBuilder(
                bloc: investBloc,
                builder: (context, state) {
                  return DropdownButtonFormField<String>(
                      items: state is AreaStateSuccess
                          ? state.areaModels.data
                              .map((e) => DropdownMenuItem<String>(
                                    value: e.id.toString(),
                                    child: Text(
                                      e.name,
                                      style: textStyle(),
                                    ),
                                  ))
                              .toList()
                          : [],
                      onChanged: (value) {
                        collectData.cityID = value;
                      },
                      decoration: InputDecoration(
                          errorStyle: textStyle(size: 10, color: Colors.red),
                          filled: true,
                          fillColor: AppColors.textFeildFillColor0x1E959595
                              .withOpacity(.12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                  color: AppColors.ffE0BC66BorderColor))));
                },
              ),
              // AuthTextField(
              //   title: AppStrings.aqarLocation,
              //   onSaved: (p0) {
              //     collectData. = p0;
              //   },
              //   validator: (p0) {
              //     return p0!.isEmpty ? AppStrings.pleaseFillData : null;
              //   },
              // ),
              16.verticalSpace,
              // AuthTextField(
              //   title: AppStrings.aqarLocation,
              //   onSaved: (p0) {
              //     collectData. = p0;
              //   },
              //   validator: (p0) {
              //     return p0!.isEmpty ? AppStrings.pleaseFillData : null;
              //   },
              // ),
              // 16.verticalSpace,
              AuthTextField(
                title: AppStrings.roomNo,
                type: TextFormFeildTypes.numbers,
                onSaved: (p0) {
                  collectData.maxRooms = p0;
                },
                validator: (p0) {
                  return p0!.isEmpty ? AppStrings.pleaseFillData : null;
                },
              ),
              16.verticalSpace,
              AuthTextField(
                type: TextFormFeildTypes.numbers,
                title: AppStrings.livingRoomNo,
                onSaved: (p0) {
                  collectData.lounges = p0;
                },
                validator: (p0) {
                  return p0!.isEmpty ? AppStrings.pleaseFillData : null;
                },
              ),
              16.verticalSpace,
              AuthTextField(
                type: TextFormFeildTypes.numbers,
                title: AppStrings.bathroomNo,
                onSaved: (p0) {
                  collectData.bathrooms = p0;
                },
                validator: (p0) {
                  return p0!.isEmpty ? AppStrings.pleaseFillData : null;
                },
              ),
              16.verticalSpace,
              AuthTextField(
                title: AppStrings.view,
                onSaved: (p0) {
                  collectData.view = p0;
                },
                validator: (p0) {
                  return p0!.isEmpty ? AppStrings.pleaseFillData : null;
                },
              ),
              16.verticalSpace,
              AuthTextField(
                type: TextFormFeildTypes.numbers,
                title: AppStrings.price,
                onSaved: (p0) {
                  collectData.price = p0;
                },
                validator: (p0) {
                  return p0!.isEmpty ? AppStrings.pleaseFillData : null;
                },
              ),
              16.verticalSpace,
              Text(
                AppStrings.aqarPictures,
                style:
                    textStyle(size: 16, color: Colors.black.withOpacity(.26)),
              ),
              16.verticalSpace,
              const InvestAqarImages(),
              16.verticalSpace,
              AuthTextField(
                title: AppStrings.name,
                onSaved: (p0) {
                  // collectData. = p0;
                },
                validator: (p0) {
                  return p0!.isEmpty ? AppStrings.pleaseFillData : null;
                },
              ),
              16.verticalSpace,

              AuthTextField(
                title: AppStrings.phoneNo,
                type: TextFormFeildTypes.numbers,
                onSaved: (p0) {
                  // collectData. = p0;
                },
                validator: (p0) {
                  return p0!.isEmpty ? AppStrings.pleaseFillData : null;
                },
              ),
              48.verticalSpace,
              BlocBuilder(
                bloc: investBloc,
                builder: (context, state) {
                  return CustomContainerButton(
                    title: AppStrings.signup,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        investBloc.add(InvestEventStart(
                            context: context, collectData: collectData));
                      }
                    },
                  );
                },
              ),
              24.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}

class InvestAqarImages extends StatelessWidget {
  const InvestAqarImages({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final InvestCubit investCubit = KiwiContainer().resolve<InvestCubit>();

    return BlocBuilder(
      bloc: investCubit,
      builder: (context, state) {
        return Container(
          width: 333.w,
          height: 200.h,
          padding:
              EdgeInsets.only(top: 25.h, bottom: 10.h, left: 30.w, right: 30.w),
          decoration: BoxDecoration(
              color: AppColors.textFeildFillColor0x1E959595,
              border:
                  Border.all(color: AppColors.ffE0BC66BorderColor, width: 2.w),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Expanded(
                child: investCubit.aqarImages.isEmpty
                    ? Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          onTap: () {
                            investCubit.getAddPics();
                          },
                          child: Container(
                            width: 61.w,
                            height: 46.h,
                            decoration: BoxDecoration(
                              // color: !Get.isDarkMode
                              //     ? Colors.white
                              //     : lightGrayColor7C7D7E,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                width: 1.w,
                                color: AppColors.ffE0BC66BorderColor,
                              ),
                            ),
                            child: const Icon(
                              Icons.add_to_photos,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    : GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisExtent: 46.h,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h),
                        itemCount: investCubit.aqarImages.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return index == 0
                              ? InkWell(
                                  onTap: () {
                                    investCubit.getAddPics();
                                  },
                                  child: Container(
                                    width: 61.w,
                                    height: 46.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        width: 1.w,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add_to_photos,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              : PopupMenuButton(
                                  clipBehavior: Clip.hardEdge,
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                        child: Text(
                                          AppStrings.open,
                                          style: textStyle(),
                                        ),
                                        onTap: () {
                                          Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (context) => Scaffold(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            body: Center(
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    // height.h
                                                                    //     Get.height * .25),
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        PhotoView(
                                                                      backgroundDecoration:
                                                                          const BoxDecoration(
                                                                              color: Colors.transparent),
                                                                      imageProvider: FileImage(investCubit
                                                                              .aqarImages[
                                                                          index -
                                                                              1]),
                                                                    ),
                                                                  ),
                                                                  CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    child: IconButton(
                                                                        onPressed: () {
                                                                          context
                                                                              .pop();
                                                                        },
                                                                        icon: const Icon(
                                                                          Icons
                                                                              .close_outlined,
                                                                          color:
                                                                              Colors.red,
                                                                        )),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ));
                                            },
                                          );
                                        }),
                                    PopupMenuItem(
                                        onTap: () {
                                          investCubit
                                              .deleteSelectedImage(index - 1);
                                        },
                                        child: Text(
                                          AppStrings.delete,
                                          style: textStyle(),
                                        ))
                                  ],
                                  child: Container(
                                    width: 61.w,
                                    height: 46.h,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(investCubit
                                              .aqarImages[index - 1]),
                                          fit: BoxFit.fill),
                                      // color: lightGrayColor7C7D7E,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        width: 1.w,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                        }),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomContainerButton(
                title: AppStrings.deleteAll,
                width: 196.w,
                height: 45.h,
                textSize: 12,
                onPressed: () {
                  investCubit.removeAllImages();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
