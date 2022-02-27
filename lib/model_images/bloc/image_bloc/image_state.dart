

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/model_images/data_layer/model/image.dart';


@immutable
abstract class ImageState extends Equatable
{

}

class InitialImageState extends ImageState
{
  @override
  List<Object?> get props => [];
}


class LoadingImageState extends ImageState
{
  @override
  List<Object?> get props => [];

}


class LoadedImageState extends ImageState
{
  List<ModelImage>? images;
  LoadedImageState({required this.images});
  @override
  List<Object?> get props => [images];
}

class FailureImageState extends ImageState
{
  final String error;
  FailureImageState({required this.error});
  @override
  List<Object?> get props => [error];

}