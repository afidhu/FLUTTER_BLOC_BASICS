


import '../../domain/entities/meta_entity.dart';

class MetaModel extends MetaEntity {
const  MetaModel({
   super.createdAt,
   super.updatedAt,
   super.barcode,
   super.qrCode,});

 factory MetaModel.fromJson(dynamic json) {
   return MetaModel(
     createdAt: json['createdAt'].toString(),
     updatedAt: json['updatedAt'].toString(),
     barcode: json['barcode'].toString(),
     qrCode: json['qrCode'].toString(),
   );
 }
}
