import 'package:coffee_mate/utils/constants.dart';
import 'package:coffee_mate/utils/services.dart';
import 'package:get/get.dart';

import '../models/coffee_model.dart';

class CoffeeController extends GetxController {
  var coffeeList = <CoffeeModel>[].obs;
  var favList = <Item>[].obs;
  var selectedChip = 0.obs;

  void fetchCoffee() async {
    coffeeList.value = await Services.parseCoffeeList(Constants.coffeeList);
  }

  @override
  void onInit() {
    fetchCoffee();
    super.onInit();
  }

  @override
  void onClose() {
    coffeeList.clear();
    super.onClose();
  }
}
