// To parse this JSON data, do
//
//     final foodres = foodresFromJson(jsonString);

import 'dart:convert';

Foodres foodresFromJson(String str) => Foodres.fromJson(json.decode(str));

String foodresToJson(Foodres data) => json.encode(data.toJson());

class Foodres {
  String uri;
  dynamic calories;
  dynamic totalWeight;
  List<String> dietLabels;
  List<String> healthLabels;
  List<dynamic> cautions;
  Map<String, TotalNutrient> totalNutrients;

  Foodres({
    this.uri,
    this.calories,
    this.totalWeight,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.totalNutrients,
  });

  factory Foodres.fromJson(Map<String, dynamic> json) => Foodres(
    uri: json["uri"],
    calories: json["calories"],
    totalWeight: json["totalWeight"],
    dietLabels: List<String>.from(json["dietLabels"].map((x) => x)),
    healthLabels: List<String>.from(json["healthLabels"].map((x) => x)),
    cautions: List<dynamic>.from(json["cautions"].map((x) => x)),
    totalNutrients: Map.from(json["totalNutrients"]).map((k, v) => MapEntry<String, TotalNutrient>(k, TotalNutrient.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "calories": calories,
    "totalWeight": totalWeight,
    "dietLabels": List<dynamic>.from(dietLabels.map((x) => x)),
    "healthLabels": List<dynamic>.from(healthLabels.map((x) => x)),
    "cautions": List<dynamic>.from(cautions.map((x) => x)),
    "totalNutrients": Map.from(totalNutrients).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class TotalNutrient {
  String label;
  dynamic quantity;
  Unit unit;

  TotalNutrient({
    this.label,
    this.quantity,
    this.unit,
  });

  factory TotalNutrient.fromJson(Map<String, dynamic> json) => TotalNutrient(
    label: json["label"],
    quantity: json["quantity"],
    unit: unitValues.map[json["unit"]],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "quantity": quantity,
    "unit": unitValues.reverse[unit],
  };
}

enum Unit { MG, KCAL, G, UNIT_G, IU, PERCENT}

final unitValues = EnumValues({
  "g": Unit.G,
  "IU": Unit.IU,
  "kcal": Unit.KCAL,
  "mg": Unit.MG,
  "µg": Unit.UNIT_G,
  "%": Unit.PERCENT
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
