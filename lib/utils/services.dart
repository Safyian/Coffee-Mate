import 'dart:convert';

import '../models/coffee_model.dart';

class Services {
  static Future<List<CoffeeModel>> parseCoffeeList(String jsonString) async {
    final parsed = await json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed
        .map<CoffeeModel>((json) => CoffeeModel.fromJson(json))
        .toList();
  }

  // favourite list
  static Future<List<Item>> parseFavouriteList(String jsonString) async {
    final parsed = await json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<Item>((json) => Item.fromJson(json)).toList();
  }
}
