# E-Commerce Mobile App

A modern Flutter-based e-commerce application built with Clean Architecture principles, providing a seamless shopping experience with offline support.

## Features

- **Product Catalog**: Browse and search through a wide range of products
- **Offline Support**: View products even without an internet connection
- **Real-time Updates**: Product information stays up-to-date

- **Clean Architecture**: Maintainable and testable codebase

## Architecture

The app follows Clean Architecture with clear separation of concerns:

- **Domain Layer**: Business logic and use cases
- **Data Layer**: Data sources and repositories

## Tech Stack

- **Framework**: Flutter
- **State Management**: Provider
- **Networking**: http package
- **Local Storage**: Hive
- **Dependency Injection**: get_it



## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code with Flutter plugin
- An emulator or physical device for testing

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Biruktadele/2025-project-phase-mobile-tasks.git
   cd ecommerce
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Running Tests

To run unit tests:
```bash
flutter test
```

For widget tests:
```bash
flutter test test/widget_test.dart
```

## Project Structure

```
lib/
├── core/
│   ├── constants/     # App-wide constants
│   ├── error/         # Error handling
│   └── network/       # Network connectivity
├── features/
│   └── product_catalog/
│       ├── data/           # Data layer
│       │   ├── datasources/  # Local & remote data sources
│       │   ├── models/      # Data models
│       │   └── repositories/ # Repository implementations
│       ├── domain/         # Business logic
│       │   ├── entities/    # Business objects
│       │   ├── repositories/# Repository interfaces
│       │   └── usecases/    # Application use cases
│       └── presentation/    # UI layer (to be implemented)
└── main.dart           # App entry point
```

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev/) for the amazing cross-platform framework
- [Dartz](https://pub.dev/packages/dartz) for functional programming in Dart

---

<div align="center">
  Made with ❤️ using Flutter
</div>
