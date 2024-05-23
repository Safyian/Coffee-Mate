import 'package:get/get.dart';

import '../models/coffee_model.dart';

class DetailScreenController extends GetxController {
  var sizeSelection = 0.obs;
  var typeSelected = "".obs;
  var myCart = <Item>[].obs;

  var noOfItems = 0.obs;
  var subTotal = 0.0.obs;
  var discount = 1.30.obs;
  var totalPayment = 0.0.obs;

  var tab = 0.obs;
  var discountApplied = false.obs;

  var orderDetail = <Item>[].obs;

  var showOrder = false.obs;

  void incrementItemQuantity(int index) {
    if (myCart[index].quantity != null) {
      myCart[index].quantity = myCart[index].quantity! + 1;
      paymentSummary();
    } else {
      myCart[index].quantity = 1;
      paymentSummary();
    }
    myCart.refresh(); // To update the UI
  }

  void decrementItemQuantity(int index) {
    if (myCart[index].quantity != null && myCart[index].quantity! > 1) {
      myCart[index].quantity = myCart[index].quantity! - 1;
      paymentSummary();
    } else {
      myCart[index].quantity = 1;
      paymentSummary();
    }
    paymentSummary();
    myCart.refresh(); // To update the UI
  }

  void paymentSummary() {
    noOfItems.value = 0;
    subTotal.value = 0.0;
    totalPayment.value = 0.0;
    discount.value = 1.30;
    for (var element in myCart) {
      noOfItems.value = noOfItems.value + element.quantity!;
      subTotal.value = subTotal.value + element.price * element.quantity!;
      totalPayment.value =
          totalPayment.value + element.price * element.quantity!;
    }
    if (totalPayment.value > 9) {
      totalPayment.value = totalPayment.value - discount.value;
    } else {
      discount.value = 0.0;
    }
  }
}
