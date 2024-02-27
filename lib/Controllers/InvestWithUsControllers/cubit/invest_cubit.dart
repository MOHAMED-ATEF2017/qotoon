import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'invest_state.dart';

class InvestCubit extends Cubit<InvestCubitState> {
  InvestCubit() : super(InvestCubitState());

  List<dynamic> aqarImages = [];
  final picker = ImagePicker();

  void deleteSelectedImage(int index) {
    aqarImages.removeAt(index);
    emit(DeleteAqarImagesState());
  }

  void getAddPics() async {
    // Get.focusScope!.unfocus();
    final pickedFiles = await picker.pickMultiImage(
      imageQuality: 100,
    );
    // final pickedFiles = await picker.pickMultiImage() ;
    for (var element in pickedFiles) {
      aqarImages.add(File(element.path));
    }
    emit(DeleteAqarImagesState());
  }

  void removeAllImages() {
    aqarImages.clear();
    emit(DeleteAqarImagesState());
  }
}
