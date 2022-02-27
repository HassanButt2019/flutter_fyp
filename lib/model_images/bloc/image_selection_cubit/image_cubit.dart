


import 'package:bloc/bloc.dart';

class ImageSelectionCubit extends Cubit<bool> {
  ImageSelectionCubit() : super(false);

  void selectImage() => emit(true);
  void unSelectImage() => emit(false);
}