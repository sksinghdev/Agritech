# 🌱 Agritech Flutter Application

A modern **Agritech mobile application** built using **Flutter**, designed to empower **farmers and agricultural stakeholders** with real-time insights on crops, weather, irrigation, and market prices.  

The app follows **Clean Architecture**, **modular design**, and implements an **offline-first strategy** for seamless usage even in low-connectivity environments.

---

## 🚀 Features

- **Crop Monitoring** – Track crop health, growth stages, and details.
- **Weather Insights** – Real-time weather data with offline caching support.
- **Irrigation Management** – Manage and monitor irrigation schedules.
- **Market Prices** – Check current market prices for various crops.
- **Offline-First Strategy** – Data cached locally using Hive for smooth offline access.
- **Modular Architecture** – Clear separation of concerns for easy maintenance and scalability.
- **Dependency Injection** – Using `get_it` for a clean and manageable DI setup.
- **Navigation** – Structured routing using `auto_route`.

---

## 🏗️ Architecture Overview

The application is structured following **Clean Architecture**, separating concerns into three main layers:  

## 📁 Directory Structure


'''
agritech
├── lib/
│ ├── main.dart
│ ├── core/
│ │ ├── error/failures.dart
│ │ ├── network/
│ │ │ ├── api_service.dart
│ │ │ ├── endpoints.dart
│ │ │ └── network_service.dart
│ │ ├── storage/hive_manager.dart
│ │ └── utils/
│ │ ├── constants.dart
│ │ └── result.dart
│ ├── di/injector.dart
│ ├── features/
│ │ ├── crops/
│ │ │ ├── data/
│ │ │ │ ├── models/crop_model.dart
│ │ │ │ ├── repositories/crops_repository_impl.dart
│ │ │ │ └── sources/
│ │ │ │ ├── crops_api_source.dart
│ │ │ │ └── crops_local_source.dart
│ │ │ ├── domain/
│ │ │ │ ├── entities/crop.dart
│ │ │ │ ├── repositories/crops_repository.dart
│ │ │ │ └── usecases/get_crops_usecase.dart
│ │ │ └── presentation/
│ │ │ ├── cubit/crops_cubit.dart
│ │ │ ├── cubit/crops_state.dart
│ │ │ ├── pages/crops_page.dart
│ │ │ └── widgets/crop_card.dart
│ │ ├── irrigation/
│ │ │ ├── data/
│ │ │ │ ├── models/irrigation_model.dart
│ │ │ │ ├── repositories/irrigation_repository_impl.dart
│ │ │ │ └── sources/
│ │ │ │ ├── irrigation_api_source.dart
│ │ │ │ └── irrigation_local_source.dart
│ │ │ ├── domain/
│ │ │ │ ├── entities/irrigation.dart
│ │ │ │ ├── repositories/irrigation_repository.dart
│ │ │ │ └── usecases/get_irrigation_usecase.dart
│ │ │ └── presentation/
│ │ │ ├── cubit/irrigation_cubit.dart
│ │ │ ├── cubit/irrigation_state.dart
│ │ │ └── pages/irrigation_page.dart
│ │ ├── market/
│ │ │ ├── data/
│ │ │ │ ├── models/price_model.dart
│ │ │ │ ├── repositories/market_repository_impl.dart
│ │ │ │ └── sources/
│ │ │ │ ├── market_api_source.dart
│ │ │ │ └── market_local_source.dart
│ │ │ ├── domain/
│ │ │ │ ├── entities/price.dart
│ │ │ │ ├── repositories/market_repository.dart
│ │ │ │ └── usecases/get_market_prices_usecase.dart
│ │ │ └── presentation/
│ │ │ ├── cubit/market_cubit.dart
│ │ │ ├── cubit/market_state.dart
│ │ │ └── pages/market_page.dart
│ │ └── weather/
│ │ ├── data/
│ │ │ ├── models/weather_model.dart
│ │ │ ├── repositories/weather_repository_impl.dart
│ │ │ └── sources/
│ │ │ ├── weather_api_source.dart
│ │ │ └── weather_local_source.dart
│ │ ├── domain/
│ │ │ ├── entities/weather.dart
│ │ │ ├── repositories/weather_repository.dart
│ │ │ └── usecases/get_weather_usecase.dart
│ │ └── presentation/
│ │ ├── cubit/weather_cubit.dart
│ │ ├── cubit/weather_state.dart
│ │ └── pages/weather_page.dart
│ └── routes/
│ ├── app_router.dart
│ └── app_router.gr.dart
└── wiremock/
├── server.js
└── stubs/crops.ejs

'''


### **Data Layer**
- API integration via **Dio**
- Local storage and caching via **Hive**
- Repository implementations to manage data fetching and caching

### **Domain Layer**
- **Entity definitions** using `Equatable` for value equality
- **Repository interfaces**
- **Use cases** encapsulating business logic

### **Presentation Layer**
- State management with `flutter_bloc` and **Cubit**
- UI pages and reusable widgets
- Offline-first data handling with network and local sources

---

## 📦 Dependencies

### **Core Dependencies**
- `dio` – HTTP client for API requests
- `flutter_bloc` – State management
- `equatable` – For value equality in entities
- `get_it` – Dependency injection
- `dartz` – Functional programming utilities
- `auto_route` – Navigation
- `hive` & `hive_flutter` – Local storage and caching
- `path_provider` – File system access
- `cached_network_image` – Efficient image loading and caching
- `connectivity_plus` – Network connectivity detection

### **Dev Dependencies**
- `auto_route_generator` – Route code generation
- `build_runner` – Code generation tool
- `hive_generator` – Hive type adapter generation

---

## 🛠️ Mock Data Setup

The app uses **`.ejs` files** and a **`server.js`** file for mocking API responses during development.  

- **Start server:**  
  ```bash
  node server.js

📡 Offline-First Strategy

- Data is persisted locally using Hive.

- App detects network availability with connectivity_plus.

- When offline, users can access previously loaded data.

- Once online, the app automatically refreshes data from APIs.

---

## ⚡ Getting Started

Follow these steps to set up and run the Agritech Flutter application locally:

### 1. Clone the repository
```bash
git clone <repository_url>
cd agritech_flutter_app
```
### 2. Install dependencies 
```bash
flutter pub get
```
### 3. Generate code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
### 4. Start the mock server
```bash
node wiremock/server.js
```

### 5. Start the mock server
```bash
flutter run
```