import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fyp/model_images/bloc/image_bloc/image_bloc.dart';
import 'package:flutter_fyp/model_images/bloc/image_bloc/image_event.dart';
import 'package:flutter_fyp/model_images/bloc/image_bloc/image_state.dart';
import 'package:flutter_fyp/model_images/bloc/image_selection_cubit/image_cubit.dart';
import 'package:flutter_fyp/model_images/data_layer/repository/image_repository.dart';
import 'package:flutter_fyp/model_images/widgets/image_widget.dart';

class ModelImageListPage extends StatelessWidget {
  ModelImageListPage({Key? key, this.modelName}) : super(key: key);
  String? modelName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      ImageBloc(RepositoryProvider.of<ImageRepository>(context))
        ..add(RequestImage(type: modelName!)),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        appBar: AppBar(
          title: Text(modelName!),
          elevation: 0.1,
          backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<ImageSelectionCubit>().selectImage();
                },
                icon: const Icon(Icons.check)),
            IconButton(
                onPressed: () {
                  context.read<ImageSelectionCubit>().unSelectImage();
                },
                icon: const Icon(Icons.remove))
          ],
        ),
        body: const _ModelImageListPageView(),
      ),
    );
  }
}

class _ModelImageListPageView extends StatefulWidget {
  const _ModelImageListPageView({Key? key}) : super(key: key);

  @override
  _ModelImageListPageViewState createState() => _ModelImageListPageViewState();
}

class _ModelImageListPageViewState extends State<_ModelImageListPageView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageBloc, ImageState>(
      listener: (context , state){},
      builder: (context , state){
        print(state);
        if(state is InitialImageState)
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        if(state is LoadingImageState)
        {

       return const Center(
            child: CircularProgressIndicator(),
          );

        }

        if(state is LoadedImageState)
        {

         return GridView.builder(
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return  ImageWidget(image: state.images![index]);
            },
            itemCount: state.images!.length,
          );

        }

        if(state is FailureImageState)
        {
          return Center(
            child: Text(state.error.toString()),
          );
        }

        return Container();

      },



    );
  }
}



