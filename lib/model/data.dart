import 'dart:convert';

class DataModel {
  String? id;
  String? judul;
  String? keterangan;
  int? nominal;
  String? jenis;
  String? waktu;
  DataModel({
    this.id,
    this.judul,
    this.keterangan,
    this.nominal,
    this.jenis,
    this.waktu,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'keterangan': keterangan,
      'nominal': nominal,
      'jenis': jenis,
      'waktu': waktu,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'],
      judul: map['judul'],
      keterangan: map['keterangan'],
      nominal: map['nominal'],
      jenis: map['jenis'],
      waktu: map['waktu'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source));
}
