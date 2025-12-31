

import 'package:equatable/equatable.dart';

class MetaEntity extends Equatable{


 final String? createdAt;
 final String? updatedAt;
 final String? barcode;
 final String? qrCode;

  const MetaEntity({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,});

  @override
  // TODO: implement props
  List<Object?> get props => [createdAt,updatedAt,barcode,qrCode];
}