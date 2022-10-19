import 'dart:math';
import '../Provider/Chuck_Provider.dart';

FraseProvider fraseProvider = FraseProvider();

class Frase {
  List<ModelFrase> items = [];

  Frase();

  Frase.fromJsonList(jsonList) {
    for (var item in jsonList) {
      final frase = ModelFrase.fromJsonMap(item);
      items.add(frase);
    }
  }
}

class ModelFrase {
  ModelFrase({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.value,
  });

  List<String> categories;
  DateTime createdAt;
  String iconUrl;
  String id;
  DateTime updatedAt;
  String url;
  String value;

  factory ModelFrase.fromJsonMap(Map<String, dynamic> json) => ModelFrase(
    categories: List<String>.from(json["categories"].map(
            (x) => x.toString())), //Usamos List.from para convertir el json en una lista
    createdAt: DateTime.parse(json[
    "created_at"]), //Usamos DateTime.parse para convertir el json en un DateTime
    iconUrl:"http://www.ruthlessreviews.com/wp-content/uploads/2006/03/invasion_usa_poster_02.jpg", //Usamos getImagen para obtener una imagen aleatoria
    id: json["id"],
    updatedAt: DateTime.parse(json[
    "updated_at"]), //usamos DateTime.parse para convertir el json en un DateTime
    url: json["url"],
    value: json["value"],
  );
}

