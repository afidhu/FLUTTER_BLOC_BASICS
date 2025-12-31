

import 'package:equatable/equatable.dart';

class DimensionsEntity extends Equatable{
 final double? width;
 final double? height;
 final double? depth;

 const DimensionsEntity  ({
  this.width,
  this.height,
  this.depth,});

  @override
  // TODO: implement props
  List<Object?> get props => [width,height,depth];
}