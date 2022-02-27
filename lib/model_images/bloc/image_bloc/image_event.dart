import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
abstract class ImageEvent extends Equatable
{
}

class RequestImage extends ImageEvent
{
  final String type;
  RequestImage({required this.type});
  @override
  List<Object?> get props => [type];

}