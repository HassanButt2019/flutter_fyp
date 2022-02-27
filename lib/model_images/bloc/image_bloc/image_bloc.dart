





import 'package:bloc/bloc.dart';
import 'package:flutter_fyp/model_images/bloc/image_bloc/image_event.dart';
import 'package:flutter_fyp/model_images/bloc/image_bloc/image_state.dart';
import 'package:flutter_fyp/model_images/data_layer/model/image.dart';
import 'package:flutter_fyp/model_images/data_layer/repository/image_repository.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState>
{
  ImageRepository repository;
  List<ModelImage>? images;
  ImageBloc( this.repository) : super(InitialImageState()){
    on<RequestImage> (_onPostFetched);
  }

  Future<void> _onPostFetched(RequestImage event, Emitter<ImageState> emit) async {
    print("HELLO");
 //   emit(LoadingImageState());

    try {
       images = await repository.getImages(event.type);
        return emit(LoadedImageState(images: images));
    } catch (e) {
      emit(FailureImageState(error:e.toString() ));
    }
  }
  














}