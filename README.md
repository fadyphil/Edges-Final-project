# ✈️ Trip Planner: Your Personal Travel Architect

**Trip Planner** is a sophisticated Flutter application designed to streamline the chaos of travel management. It allows users to effortlessly create detailed itineraries, manage travel budgets with real-time currency conversion, and organize trips with precision—all while functioning completely offline.

## ✨ Key Features

*   **Smart Trip Creation:** Intuitive flow for setting destinations, travel dates, and trip names.
*   **Budgeting & Currency Conversion:** Built-in currency converter that estimates your budget in foreign currencies using live rates (or cached data).
*   **Local Persistence:** Powered by **ObjectBox**, an ultra-fast NoSQL database, ensuring your data is always available, even in remote locations without internet.
*   **Reactive State Management:** Complex form validation and asynchronous operations managed seamlessly with **BLoC/Cubit**.
*   **Immutable Data Models:** Robust data integrity using `Freezed` for immutable entities and state objects.

## 🏗 Architecture & Tech Stack

This project is built on **Clean Architecture** principles, enforcing a strict separation of concerns between the Domain, Data, and Presentation layers.

*   **Architecture:** Clean Architecture + Feature-First Structure
*   **State Management:** `flutter_bloc` (Cubits)
*   **Dependency Injection:** `get_it`
*   **Database:** `objectbox` (High-performance local database)
*   **Networking:** `dio` (For currency conversion APIs)
*   **Navigation:** `auto_route`
*   **Utilities:** `intl` (Date/Currency formatting), `freezed`, `flutter_animate`

## 💻 Code Highlight: Clean State Management

The following snippet from `TripPlanningCubit` demonstrates how business logic is decoupled from the UI. It handles the complexity of input validation, asynchronous currency conversion, and UI state updates (Loading/Success/Error) in a readable, testable manner.

```dart
// lib/features/trip/presentation/blocs/trip_planning_cubit.dart

Future<void> convertBudget({
  required String fromCurrency,
  required String toCurrency,
  required String toCurrencySymbol,
}) async {
  // 1. Input Validation
  final amount = double.tryParse(state.budget);
  if (amount == null || amount <= 0) return;

  // 2. Emit Loading State
  emit(state.copyWith(conversionState: const ApiState.loading()));

  try {
    // 3. Execute Business Logic (Use Case)
    final result = await _convertCurrencyUseCase(
      fromCurrency: fromCurrency,
      toCurrency: toCurrency,
      amount: amount,
    );

    // 4. Format Data for Presentation
    final formatter = NumberFormat.currency(
      symbol: toCurrencySymbol,
      decimalDigits: 2,
    );
    
    // 5. Emit Success State
    emit(state.copyWith(
      conversionState: ApiState.success(data: result),
      convertedAmountDisplay: "≈ ${formatter.format(result)}",
    ));
  } catch (e) {
    // 6. Handle Errors gracefully
    emit(state.copyWith(
      conversionState: ApiState.error(message: e.toString()),
      convertedAmountDisplay: "Conversion failed",
    ));
  }
}
```

## 📂 Project Structure

The codebase is organized by **Feature**, ensuring scalability as the app grows.

```text
lib/
├── core/                   # Shared logic (DI, Network, Generic UseCases)
├── features/
│   ├── destination/        # Logic for selecting destinations
│   ├── trip/               # Main Trip logic
│   │   ├── data/           # Repositories & Data Sources (ObjectBox)
│   │   ├── domain/         # Entities (Trip, Budget) & Use Cases
│   │   └── presentation/   # Cubits (TripPlanningCubit) & UI
│   └── weather/            # Weather forecasting feature
├── main.dart               # Entry point
└── objectbox-model.json    # Database schema definition
```

## 🚀 Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/trip-planner.git
    cd trip-planner/trip_planner
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run Code Generation (Critical for Freezed & ObjectBox):**
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the App:**
    ```bash
    flutter run
    ```