<div align="center">

<img src="assets/images/landingImage.jpg" width="120" style="border-radius: 20px;" />

# ☕ Coffee Mate

**A sleek, full-featured coffee shop ordering app built with Flutter**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![GetX](https://img.shields.io/badge/State-GetX-8B5CF6)](https://pub.dev/packages/get)
[![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey?logo=apple)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

*Browse, customize, and order your perfect cup — anywhere, anytime.*

</div>

---

## Overview

**Coffee Mate** is a polished Flutter mobile application that delivers a complete coffee shop ordering experience. From browsing a curated menu to customizing your drink and checking out, the app demonstrates clean architecture, reactive state management, and a smooth, intuitive UI — all hallmarks of production-quality mobile development.

> Built as a portfolio project to showcase Flutter skills including custom widgets, GetX state management, form validation, animations, and full screen-to-screen navigation flows.

---

## Screenshots

### Onboarding & Authentication

| Onboarding | Login | Sign Up |
|:-----------:|:------:|:-------:|
| <img src="https://github.com/user-attachments/assets/31df36ae-5d15-40b8-bc17-441942d769df" width="220"/> | <img src="https://github.com/user-attachments/assets/5c18cd6f-ca36-4213-abf5-209fa54af908" width="220"/> | <img src="https://github.com/user-attachments/assets/83ae0d39-a604-4cfc-aa58-19162f768849" width="220"/> |
| *Welcome screen with brand imagery* | *Email & password login with guest access* | *New account creation with validation* |

---

### Home & Product Details

| Home Screen | Product Details |
|:-----------:|:---------------:|
| <img src="https://github.com/user-attachments/assets/0218144c-600a-4e3c-b2c0-e29d497ae2b6" width="300"/> | <img src="https://github.com/user-attachments/assets/651e8c01-23a4-4c74-998b-7c45675a98d0" width="300"/> |
| *Promo banner + coffee grid by category* | *Size, type customization + rating & description* |

---

### Cart & Checkout

| My Cart | Checkout |
|:-------:|:--------:|
| <img src="https://github.com/user-attachments/assets/a9dd172a-4445-4377-82b4-4127efa0cb86" width="300"/> | <img src="https://github.com/user-attachments/assets/1b155a1d-40b8-4e36-9603-7822f4a87c9d" width="300"/> |
| *Quantity controls + live payment summary* | *Delivery vs pickup toggle + coupon code* |

---

### Favourites, Profile & Order History

| Favourites | Profile | Order History |
|:----------:|:-------:|:-------------:|
| <img src="https://github.com/user-attachments/assets/9dc485a3-88d7-41e6-8f06-a9bb62e4d973" width="220"/> | <img src="https://github.com/user-attachments/assets/5233e50b-9a20-4372-869a-37b56b92e6a2" width="220"/> | <img src="https://github.com/user-attachments/assets/8c0a957f-6cac-4f6f-874a-6ea3d3ef802d" width="220"/> |
| *Saved items grid* | *Account overview & menu* | *Recent orders with status* |

---

## Features

- **Onboarding Flow** — Brand-forward welcome screen leading into auth
- **Authentication** — Login & signup with real-time form validation (email + password rules)
- **Guest Mode** — Skip login and browse the full menu instantly
- **Menu Browsing** — 20+ coffee items across 4 categories: *Coffee & Espresso, Frappuccino, Cold Brew, Tea & Chocolate*
- **Category Filtering** — Horizontal chip bar to filter the grid by drink type
- **Drink Customization** — Per-item size selection (Short → Venti) and milk/roast type picker
- **Favourites** — Add/remove items with a heart tap; persisted in session
- **Cart Management** — Add, increment, decrement items with live payment recalculation
- **Smart Discount** — Automatic $1.30 discount when order subtotal exceeds $9.00
- **Coupon Codes** — Modal input with preset coupon support
- **Delivery / Pickup Toggle** — Switch fulfilment method at checkout
- **Order History** — Recent order summary tied to completed checkouts
- **Lottie Success Animation** — Delightful order confirmation screen

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **Framework** | Flutter 3.x |
| **Language** | Dart 3.x |
| **State Management** | [GetX](https://pub.dev/packages/get) |
| **Navigation** | GetX routing (`Get.to`, `Get.offAll`) |
| **Typography** | [Google Fonts — Sora](https://fonts.google.com/specimen/Sora) |
| **Animations** | [Lottie](https://pub.dev/packages/lottie) |
| **Email Validation** | [email_validator](https://pub.dev/packages/email_validator) |
| **Expandable Text** | [readmore](https://pub.dev/packages/readmore) |
| **Cart Badge** | [badges](https://pub.dev/packages/badges) |
| **Data** | Local JSON (static menu data) |

---

## Architecture

The project follows a clean **MVC + GetX** pattern:

```
lib/
├── main.dart
├── models/
│   └── coffee_model.dart              # Item & CoffeeModel data classes
├── controllers/
│   ├── coffee_controller.dart         # Menu data + favourites state
│   ├── detail_screen_controller.dart  # Cart, checkout & payment logic
│   └── bottomNav_controller.dart      # Bottom nav tab state
├── views/
│   ├── onboarding_screen.dart
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   ├── coffee_detail_screen.dart
│   ├── proceed_to_checkout.dart
│   ├── order_history.dart
│   └── NavViews/
│       ├── home_screen.dart
│       ├── cart_screen.dart
│       ├── favourites_screen.dart
│       └── profile_screen.dart
├── widgets/
│   ├── custom_widgets.dart            # Reusable card, dialogs
│   └── bottom_navbar.dart             # Tab bar with GetX binding
└── utils/
    ├── constants.dart                 # Colors, theme, coffee JSON
    └── services.dart                  # JSON parsing helpers
```

**State flow:** All UI is driven by `Obx()` wrappers subscribing to `Rx` observables inside GetX controllers — zero `setState` calls in the codebase.

### Navigation Flow

```
OnboardingScreen
    └── (Get Started)
        ├── LoginScreen ←→ SignupScreen
        └── (Login / Guest)
            └── BottomNaviBar
                ├── HomeScreen
                │   └── CoffeeDetailScreen → ProceedToCheckout → Success Dialog
                ├── FavouritesScreen
                │   └── CoffeeDetailScreen
                ├── CartScreen
                │   └── ProceedToCheckout → Success Dialog
                └── ProfileScreen
                    └── OrderHistory
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later)
- Dart 3.x (bundled with Flutter)
- iOS Simulator / Android Emulator **or** a physical device

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Safyian/coffee_mate.git
cd coffee_mate

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

> No API keys or environment variables required — all data is bundled locally.

### Build for Release

```bash
# Android APK
flutter build apk --release

# iOS (requires Xcode + Apple Developer account)
flutter build ios --release
```

---

## Design Highlights

| Detail | Value |
|--------|-------|
| Primary accent | `#C67C4E` — warm espresso brown |
| Background | `#FFFFFF` clean white |
| Text dark | `#000000` |
| Text muted | `#8D8D8D` |
| Corner radius | 12–16 dp cards |
| Font | Sora (Google Fonts) |

The UI draws inspiration from modern coffee shop apps — dark header sections contrasting white card bodies, warm accent colours, and generous image use for an appetising feel.

---

## Roadmap

- [ ] Firebase Authentication (real login/signup)
- [ ] Firestore menu & order persistence
- [ ] Stripe / payment gateway integration
- [ ] Push notifications for order status
- [ ] Functional search with debounce
- [ ] Offline support with local caching (Hive / GetStorage)
- [ ] Loyalty points system
- [ ] Dark mode

---

## Contributing

Pull requests are welcome. For major changes please open an issue first to discuss what you'd like to change.

1. Fork the repo
2. Create your feature branch: `git checkout -b feat/your-feature`
3. Commit your changes: `git commit -m 'feat: add your feature'`
4. Push: `git push origin feat/your-feature`
5. Open a Pull Request

---

## License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for details.

---

<div align="center">

Made with ❤️ and ☕ by **[Safyian](https://github.com/Safyian)**

*If you found this project useful, consider giving it a ⭐*

</div>
