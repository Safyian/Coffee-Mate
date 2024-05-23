import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  // color pallets
  static const Color backgroundColor = Colors.white;
  static const Color activeColor = Color(0xFFc67c4e);
  static const Color lightColor = Colors.white;
  static const Color darkColor = Colors.black;
  static const Color textWhite = Colors.white;
  static const Color textBlack = Colors.black;
  static const Color textLight = Color(0xFFA9A9A9);
  static const Color textGrey = Color(0xFF8D8D8D);
  static const Color textGreyLight = Color(0xFFB7B7B7);

  // placeholders
  static const String landingText1 =
      "Coffee so good, your taste buds will love it.";
  static const String landingText2 =
      "The best grain, the finest roast, the powerful flavor.";
  //
  // ********* assets *********
  static const String landingImage = "assets/images/landingImage.jpg";
  static const String profileImage = "assets/images/profile.jpg";
  static const String promoImage = "assets/images/promo.jpg";
  static const String americano = "assets/images/americano.jpg";
  static const String caffeeLatte = "assets/images/caffeeLattee.jpg";
  static const String caffeeMocha = "assets/images/caffeeMocha.jpg";
  static const String chaiTea = "assets/images/chaitea.jpg";
  static const String coffeeFrapp = "assets/images/coffeeFrapp.jpg";
  static const String coldBrew = "assets/images/coldbrew.jpg";
  static const String darkMocha = "assets/images/darkmocha.jpg";
  static const String espresso = "assets/images/espresso.jpg";
  static const String espressoFrapp = "assets/images/espressofrap.jpg";
  static const String hotChoc = "assets/images/hotchoco.jpg";
  static const String maltHazelnut = "assets/images/maltyhazelnut.jpg";
  static const String saltedCaramel = "assets/images/saltedxaramel.jpg";
  static const String blackTea = "assets/images/blacktea.jpg";
  static const String emptyCart = "assets/images/empty-box.png";
  static const String emptyFav = "assets/images/takeaway-coffee.png";
  static const String discount = "assets/images/discount.png";

  // *********** Coffee List **********
  static const String coffeeList = '''
  [
    {
      "type": "Coffee & Espresso",
      "items": [
        {
          "image": "${Constants.promoImage}",
          "coffee": "Cappuccino",
          "beans": ["Roasted", "Grounded"],
          "type": ["Oat Milk", "Soy Milk", "Full Cream Milk", "Light Milk"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "To make it properly requires much skill and attentiveness. Arguably the most important part is frothing the foam to velvety perfection as the milk steams – something our baristas take great care to achieve. The milky moustache that clings to your upper lip is proof we’ve made yours right. And may we say, you wear it well.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        },
        {
          "image": "${Constants.americano}",
          "coffee": "Americano",
          "beans": ["Roasted", "Grounded"],
          "type": ["Single Shot", "Extra Shot", "Triple Shot"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "Espresso shots topped with hot water create a light layer of crema culminating in this wonderfully rich cup with depth and nuance. Pro Tip: For an additional boost, ask your barista to try this with an extra shot.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        },
        {
          "image": "${Constants.caffeeLatte}",
          "coffee": "Caffè Latte",
          "beans": ["Roasted", "Grounded"],
          "type": ["Vanilla Syrup", "Hazelnut Syrup", "Almond Syrup"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "This is the original coffeehouse classic. And like most classics, part of its appeal comes from its simplicity. A caffè latte is simply a shot or two of bold, tasty espresso with fresh, sweet steamed milk over it. Some prefer to add syrup or extra espresso to the recipe. Some maintain that it is entirely perfect as is.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        },
        {
          "image": "${Constants.caffeeMocha}",
          "coffee": "Caffè Mocha",
          "beans": ["Roasted", "Grounded"],
          "type": ["MILKLAB Oat", "Soy Milk", "Almond Milk", "Coconut Milk"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "There’s no question that chocolate and coffee are flavours meant for each other. Both are rich and full of depth. Where one is creamy, the other is roasty. They complement each other perfectly. And when they come together under a fluffy cloud of sweetened whipped cream, you’ll wish their union would last forever.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        },
        {
          "image": "${Constants.espresso}",
          "coffee": "Espresso",
          "beans": ["Roasted", "Grounded"],
          "type": ["Single Shot", "Extra Shot", "Triple Shot"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "Smooth and versatile Espresso Roast is the very heart and soul of Starbucks. Its rich flavour, lingering aroma and caramelly sweetness make it the perfect foundation for lattes, cappuccinos and all our espresso-based beverages. But you can also enjoy it all by itself – indeed, that might be the best way to discover its nuances.",
          "sizes": ["Solo (1 shot)", "Doppio (2 shots)"]
        }
      ]
    },
    {
      "type": "Frappuccino",
      "items": [
        {
          "image": "${Constants.coffeeFrapp}",
          "coffee": "Coffee Frappuccino",
          "beans": ["Roasted", "Grounded"],
          "type": ["Original", "Decaf", "Strong"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "This is our original Frappuccino® blended beverage – the one that reinvented summertime coffee for millions of coffee lovers around the world. It sparked immediate accolades and lasting devotion. Because as with any true original, the delicious taste of this refreshingly cool coffee really stands the test of time.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        },
        {
          "image": "${Constants.darkMocha}",
          "coffee": "Dark Mocha Frappuccino",
          "beans": ["Roasted", "Grounded"],
          "type": ["Original", "Decaf", "Strong"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "If you love fun in the sun, then this deliciously decadent beverage is made for you. It’s sweet, creamy and cold – just the way a good summer treat should be. And it serves up the rich, satisfying taste of dark chocolate and coffee. Pure indulgence for pure enjoyment.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        },
        {
          "image": "${Constants.espressoFrapp}",
          "coffee": "Espresso Frappuccino",
          "beans": ["Roasted", "Grounded"],
          "type": ["Oat Milk", "Soy Milk", "Full Cream Milk", "Light Milk"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "Much like our original Coffee Frappuccino® blended beverage, this delectable indulgence is a refreshing blend of our dark-roasted coffee, milk and ice. However the added shot of our rich and smooth Espresso Roast creates a bolder coffee flavour that espresso lovers get really excited about.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        }
      ]
    },
    {
      "type": "Cold Brew",
      "items": [
        {
          "image": "${Constants.coldBrew}",
          "coffee": "Cold Brew",
          "beans": ["Roasted", "Grounded"],
          "type": ["Vanilla Syrup", "Almond Syrup", "Hazelnut Syrup"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "A slow-steeped and super smooth icy-cold cup of coffee with naturally sweet undertones of refreshing citrus and chocolaty flavours – perfect to cool you down and keep you going all summer long. Cold Brew is handcrafted in small batches daily and slow-steeped for 20 hours without touching heat.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        },
        {
          "image": "${Constants.saltedCaramel}",
          "coffee": "Salted Caramel Nitro Cold Brew",
          "beans": ["Roasted", "Grounded"],
          "type": ["Salted Foam", "Whipped Cream Foam"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "Here’s a savory-meets-sweet refreshing beverage certain to delight: our signature, super-smooth cold brew, sweetened with a touch of caramel and topped with a salted, rich cold foam.",
          "sizes": ["Tall", "Grande"]
        },
        {
          "image": "${Constants.maltHazelnut}",
          "coffee": "Malty Hazelnut Cold Brew",
          "beans": ["Roasted", "Grounded"],
          "type": ["Hazelnut Foam", "Whipped Cream Foam"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "Sweetened slow steeped coffee, topped with Hazelnut Chocolate Malt cream and topped with nutty malt powder. Make it yours with MILKLAB Oat, Almond, Soy or Coconut milk and plant-based whipped cream.",
          "sizes": ["Tall", "Grande"]
        }
      ]
    },
    {
      "type": "Tea & Chocolate",
      "items": [
        {
          "image": "${Constants.chaiTea}",
          "coffee": "Chai Tea Lattè",
          "beans": ["Roasted", "Grounded"],
          "type": ["Oat Milk", "Soy Milk", "Full Cream Milk", "Light Milk"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "Flavours from the ancient Ayurvedic tradition of India. The warm, aromatic flavours of chai tea have their roots in the ancient Ayurvedic tradition of India, where roadside tea merchants can be found preparing black tea with traditional healing spices like cardamom, cinnamon and black pepper. Featuring ingredients gathered from around the globe, our version of this beloved beverage is wonderfully sweet and spicy – and every bit as soothing.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        },
        {
          "image": "${Constants.hotChoc}",
          "coffee": "Classic Hot Chocolate",
          "beans": ["Roasted", "Grounded"],
          "type": ["Oat Milk", "Soy Milk", "Full Cream Milk", "Light Milk"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "Do you remember your first hot chocolate? Sweet, creamy comfort in a cup. You instantly pegged it the best drink on earth. Chances are you’ll feel the same about our version of this classic beverage. Made with steamed milk and mocha sauce, and topped with a generous swirl of sweetened whipped cream and a marshmallow, we bet it tastes even better than the one you remember.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        },
        {
          "image": "${Constants.blackTea}",
          "coffee": "Earl Grey Black Tea",
          "beans": ["Roasted", "Grounded"],
          "type": ["Original", "Strong", "Decaf"],
          "price": 4.5,
          "rating": "4.5",
          "description":
              "A classic blend of black teas accented with the essence of Italian bergamot and lavender. The bold flavour of a traditional brand of black teas from Sri Lanka and northeast India, infused with Italian bergamot and a hint of lavender, resulting in a uniquely aromatic experience. Refined, elegant and delicious to the senses.",
          "sizes": ["Short", "Tall", "Grande", "Venti"]
        }
      ]
    }
  ]
  ''';
}

// ********* TextField Input Decoration Constant **********
InputDecoration inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    // borderSide: const BorderSide(color: Colors.grey, width: 1.0),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    // borderSide: const BorderSide(color: Colors.grey, width: 1.0),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    // borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderSide: BorderSide.none,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.red, width: 1.0),
    // borderSide: BorderSide.none,
  ),
  errorStyle: GoogleFonts.sora(fontSize: 12, color: Colors.red),
  // hintText: 'xyz@abc.com',
  hintStyle: const TextStyle(color: Colors.black54),
  // labelText: 'Email',
  labelStyle: const TextStyle(color: Colors.black54),
  filled: true,
);
