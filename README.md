# Union Shop

A Flutter application that recreates the University of Portsmouth Students’ Union Shop experience.

Users can:

- Browse product ranges (Essential, Signature, Portsmouth City Collection).
- View collections and individual collection pages.
- Open a product detail page with description, size selection, and Add to Cart button.
- View an About page, Sale page, Cart page, and simple Auth page.

This project also demonstrates basic MVVM-style separation with models, view models, and views, plus simple widget tests.

---

## 1. Project Title and Description

**Title:** Union Shop – Flutter App

**Description**  
Union Shop is a mobile‑first Flutter app that simulates the Portsmouth Students’ Union Shop. It provides a structured, multi‑screen experience showing how an online shop could be implemented in Flutter.

**Key Features**

- **Home page**
  - Header banner and basic navbar.
  - Responsive product grids by screen width (desktop/tablet/phone).
  - Three product sections:
    - Essential range
    - Signature range
    - Portsmouth City Collection
  - Footer with Opening Hours, Contact details, and Location.

- **Product page**
  - Product image, title, and price.
  - Description text.
  - Size dropdown.
  - “Add to Cart” button (UI only at the moment).
  - Simple footer (“T&Cs apply”).

- **Sale page**
  - “Big Sale! Save up to 50% on selected items.” banner.
  - Displays products using sale prices calculated from base prices.

- **Collections**
  - `CollectionsPage` shows available collections from `CollectionsViewModel`.
  - `CollectionPage` displays products in a single collection (e.g. “Autumn Favourites”).

- **About page**
  - “About Us” heading and descriptive text about the Union Shop.
  - Contact email line.
  - Scrollable content to avoid overflow on small devices.

- **Cart page**
  - Shows items from `CartViewModel` (`addToCart` and `getCartItems`).
  - Displays either an “empty cart” message or a list of products.

- **Auth page**
  - Very simple sign‑in UI (dummy logic).
  - Placeholder for future authentication features.

- **Navigation**
  - `MaterialApp` with named routes declared in `lib/main.dart`:
    - `/` – `HomePage`
    - `/about` – `AboutPage`
    - `/collections` – `CollectionsPage`
    - `/collection` – `CollectionPage`
    - `/product` – `ProductPage`
    - `/sale` – `SalePage`
    - `/cart` – `CartPage`
    - `/auth` – `AuthPage`

---

## 2. Installation and Setup Instructions

### 2.1. Prerequisites

- **OS:** Windows, macOS, or Linux
- **Flutter SDK:** 3.x+ (compatible with `sdk: ">=2.17.0 <4.0.0"` in `pubspec.yaml`)
- **Dart:** Included with Flutter
- **Tools:**
  - Git (optional but recommended)
  - Android SDK / Xcode (for emulators)
- **IDE (recommended):** Visual Studio Code with:
  - Flutter extension
  - Dart extension

### 2.2. Clone the Repository

```bash
git clone <your-repository-url> union_shop
cd union_shop
```

Replace `<your-repository-url>` with your own remote URL if you have one.

### 2.3. Install Dependencies

```bash
flutter pub get
```

This reads `pubspec.yaml` and installs:

- `flutter`
- `cupertino_icons`
- `flutter_test`
- `flutter_lints`

### 2.4. Configure Assets

`pubspec.yaml` includes:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

The project expects image files in:

```text
assets/
  images/
    green_t_shirt.WEBP
    logo.avif
    magnet_1.JPEG
    pink_essential_hoodie.WEBP
    postcard_1.JPEG
    signature_hoodie.WEBP
    signature_t_shirt.WEBP
```

Make sure:

- These files exist in `assets/images/`.
- Any `imageUrl` in your view models points to this folder, for example:

```dart
// Example in HomeViewModel / ProductViewModel / CollectionsViewModel
imageUrl: 'assets/images/green_t_shirt.WEBP',
imageUrl: 'assets/images/pink_essential_hoodie.WEBP',
imageUrl: 'assets/images/signature_hoodie.WEBP',
imageUrl: 'assets/images/signature_t_shirt.WEBP',
imageUrl: 'assets/images/magnet_1.JPEG',
imageUrl: 'assets/images/postcard_1.JPEG',
```

If the paths and files do not match, Flutter will throw “Unable to load asset …” errors.

### 2.5. Run the Project

From the project root:

```bash
flutter run
```

- Choose an attached device or emulator when prompted.
- The app will open on the Home page (`/`).

---

## 3. Usage Instructions

### 3.1. Main Navigation

Routing is managed in `lib/main.dart` via `MaterialApp`:

- `initialRoute: '/'`
- Routes map strings like `/about`, `/collections`, `/product`, etc., to their corresponding pages.

To navigate in code:

```dart
Navigator.pushNamed(context, '/about');
Navigator.pushNamed(context, '/product');
Navigator.pushNamed(context, '/cart');
```

### 3.2. Home Page

File: `lib/views/home_page.dart`

- Shows:
  - Top header and logo.
  - Promotional banner.
  - Product sections:
    - Essential range
    - Signature range
    - Portsmouth City Collection
  - Footer with:
    - Opening Hours
    - Contact Us
    - Location

Data source: `HomeViewModel` (`lib/view_models/home_view_model.dart`) which returns lists of `Product` objects.

Typical user flow:

1. Open the app (lands on `HomePage`).
2. Scroll down to explore the three product sections.
3. Tap a product card to navigate to a product detail page (when wired up with `Navigator.pushNamed`).

### 3.3. Product Page

File: `lib/views/product_page.dart`  
View model: `lib/view_models/product_view_model.dart`

- Retrieves a dummy product via `ProductViewModel.getProductById`.
- Shows:
  - Banner “PRODUCT”.
  - Logo which can navigate back home.
  - Product image (e.g. a T‑shirt).
  - Product title and price.
  - Description text.
  - Size `DropdownButton`.
  - “Add to Cart” `ElevatedButton`.
  - Footer “T&Cs apply”.

Configuration:

- Currently uses a hard‑coded product ID and placeholder data.
- Can be extended to receive `productId` via navigation arguments.

### 3.4. Sale Page

File: `lib/views/sale_page.dart`  
Data: `HomeViewModel().getProducts()`

- AppBar: typically “Sale Items” (depending on implementation).
- Banner text: “Big Sale! Save up to 50% on selected items.”
- Lists products (e.g. using `ListView.builder`).
- Shows:
  - Product image via `Image.asset(product.imageUrl)`.
  - Original price text.
  - Discounted sale price text.

### 3.5. Collections & Collection Page

- **CollectionsPage:** `lib/views/collections_page.dart`
  - Uses `CollectionsViewModel` to get all collections.
  - Displays a grid of collection cards.
  - Each card shows:
    - A representative image.
    - Collection name.
  - Tapping a card navigates to a `CollectionPage` showing products in that collection.

- **CollectionPage:** `lib/views/collection_page.dart`
  - Has a `collectionName` parameter for the app bar title.
  - Shows:
    - A filter `DropdownButton<String>` (dummy / placeholder).
    - A `ListView` of products using `HomeViewModel().getProducts()` (example data).

### 3.6. About Page

File: `lib/views/about_page.dart`

- AppBar title: “About Us”.
- Layout:
  - Heading “About Us”.
  - Long text explaining the purpose of the Union Shop.
  - Contact line: “Contact us at unionshop@upsu.net”.
- Wrapped in `SingleChildScrollView` to prevent overflow on small screens.

### 3.7. Cart & Auth

- **CartPage:** `lib/views/cart_page.dart`
  - Uses `CartViewModel`:

    ```dart
    class CartViewModel {
      final List<Product> cartItems = [];

      void addToCart(Product product) {
        cartItems.add(product);
      }

      List<Product> getCartItems() => cartItems;
    }
    ```

  - If `cartItems` is empty, shows an “empty cart” message.
  - If not empty, shows a list of products with a “Checkout” button.

- **AuthPage:** `lib/views/auth_page.dart`
  - Simple “Sign In” form using text fields for email and password.
  - `AuthViewModel` exists as a placeholder; real authentication is not implemented.

### 3.8. How to Run Tests

From the project root:

```bash
flutter test
```

Or run a specific test file:

```bash
flutter test test/home_page_test.dart
flutter test test/product_page_test.dart
flutter test test/about_page_test.dart
flutter test test/sale_page_test.dart
flutter test test/collections_page_test.dart
flutter test test/collection_page_test.dart
```

Tests are intentionally minimal and only verify that pages build and show certain key texts.

---

## 4. Project Structure and Technologies Used

### 4.1. Folder Structure (High Level)

```text
lib/
  main.dart                    # App entry point & route setup

  models/
    product.dart               # Product model
    user.dart                  # User model (placeholder)
    collection.dart            # Collection model

  view_models/
    home_view_model.dart       # Products for home & sale pages
    product_view_model.dart    # Single product retrieval
    collections_view_model.dart# Collections list
    cart_view_model.dart       # Simple in-memory cart
    auth_view_model.dart       # Dummy auth manager

  views/
    home_page.dart             # Main landing page
    product_page.dart          # Product details page
    sale_page.dart             # Sale items page
    about_page.dart            # About Us page
    collections_page.dart      # Collections overview
    collection_page.dart       # Single collection view
    auth_page.dart             # Sign in form
    cart_page.dart             # Simple cart UI
    product_card.dart          # Reusable product card widget

assets/
  images/
    green_t_shirt.WEBP
    logo.avif
    magnet_1.JPEG
    pink_essential_hoodie.WEBP
    postcard_1.JPEG
    signature_hoodie.WEBP
    signature_t_shirt.WEBP

test/
  home_page_test.dart
  product_page_test.dart
  about_page_test.dart
  sale_page_test.dart
  collections_page_test.dart
  collection_page_test.dart
```

### 4.2. Technologies and Packages

From `pubspec.yaml`:

- **Framework:** Flutter
- **Language:** Dart
- **UI:** Material widgets (`flutter/material.dart`)
- **Packages:**
  - `cupertino_icons`
  - `flutter_test`
  - `flutter_lints`

### 4.3. Development Tools

- Flutter SDK (Dart, `flutter run`, `flutter test`).
- Visual Studio Code with Flutter and Dart extensions.
- Optionally: Android Studio / Xcode for emulator/simulator management.

---

## 5. Known Issues or Limitations

- **Hard‑coded data:**
  - Products, collections, and user information come from view models; no backend or database.

- **Assets must match paths:**
  - If any `imageUrl` in a view model does not match an existing file in `assets/images/`, both the app and widget tests will fail with “Unable to load asset”.

- **Cart and Auth are simplified:**
  - `CartViewModel` only supports adding items to an in‑memory list.
  - Real removal, persistence, and checkout logic are not implemented.
  - `AuthViewModel` does not include real authentication, just placeholders.

- **Navigation arguments:**
  - Product ID passing is basic; `ProductPage` can be extended to accept arguments from routes.

- **Limited test depth:**
  - Tests focus on:
    - “Does this page build?”
    - “Is this text shown?”
  - They do not yet test navigation flows or state changes deeply.

---

## 6. Future Improvements

- Replace dummy data with:
  - JSON configuration files, or
  - A live backend / API.

- Implement:
  - Full cart functionality (add, remove, update quantity, totals).
  - Checkout and order confirmation screen.
  - Real authentication and session management.

- Enhance UI/UX:
  - Better responsive layouts for tablet and desktop sizes.
  - More detailed visual styles and theming.

- Improve accessibility:
  - Add semantics labels and focus handling.
  - Improve keyboard and screen‑reader support.

- Expand tests:
  - Navigation tests (e.g. Home → Product, Collections → CollectionPage).
  - Tests for cart and auth behaviour once they are fully implemented.

---

## 7. Contact Information

- **Developer:** Taiyeb Ahmed
- **Email:** up2274842@myport.ac.uk
- **GitHub / Portfolio:** [ty694nite](https://github.com/ty694nite)

