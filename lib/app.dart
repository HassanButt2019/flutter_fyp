



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fyp/model_images/data_layer/repository/image_repository.dart';

import 'model_images/view/model_list_page.dart';

class ModelImagesApp extends StatelessWidget {
  const ModelImagesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context)=>ImageRepository(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: const Color.fromRGBO(58, 66, 86, 1.0)),
        home:const ModelListPage(),
      ),
    );
  }
}
