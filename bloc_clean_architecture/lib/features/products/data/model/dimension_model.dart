


import '../../domain/entities/dimension_entity.dart';

class DimensionsModel extends DimensionsEntity {
 const DimensionsModel({
   super.width,
   super.height,
   super.depth,});

 factory DimensionsModel.fromJson(dynamic json) {
    return DimensionsModel(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      depth:(json['depth'] as num).toDouble(),
    );
  }
}