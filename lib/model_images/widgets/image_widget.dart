

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fyp/model_images/bloc/image_selection_cubit/image_cubit.dart';
import 'package:flutter_fyp/model_images/data_layer/model/image.dart';

class ImageWidget extends StatefulWidget {
 ImageWidget({Key? key ,required this.image}) : super(key: key);
  ModelImage image;

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageSelectionCubit(),
      child:BlocBuilder<ImageSelectionCubit, bool>(
          builder: (context, state) {


            // "https://media.istockphoto.com/photos/young-beautiful-woman-picture-id1294339577?b=1&k=20&m=1294339577&s=170667a&w=0&h=_5-SM0Dmhb1fhRdz64lOUJMy8oic51GB_2_IPlhCCnU="
          return CachedNetworkImage(
            imageUrl:widget.image.labelFile,
            imageBuilder: (context, imageProvider) => GestureDetector(
              onTap: ()=>  context.read<ImageSelectionCubit>().selectImage(),
              onDoubleTap: ()=>  context.read<ImageSelectionCubit>().unSelectImage(),

              child: Container(
                margin:const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: state?Border.all(
                    width: 3,
                    color: Colors.red,
                  ):null,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    //  colorFilter:
                    // const ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                  ),
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        }
      ),
    );
  }
}
