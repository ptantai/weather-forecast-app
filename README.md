# Weather App

A basic application that displays current weather information for a given location.

## Getting Started

This project is a starting point for a Flutter application implementing Clean Architecture

### Clone the Repository

1. Open your terminal or command prompt.

2. Use the following command to clone the WeatherApp repository:

`git clone https://github.com/ptantai/weather-forecast-app.git`

### Configuration

##### Change your working directory to the cloned repository:

`cd weather-forecast-app`

##### Get all packages dependencies

`flutter pub get`

##### Run the build runner command

`flutter pub run build_runner build `

### Run the project

1. Connect your device or start an emulator.

2. To build and run the project, use the following command:

`flutter run` or simply press ` F5 key` if you are using VSCode

This will build the project and install it on your connected device or emulator.

## Folder Structure

```
    lib
    ├── application.dart
    ├── data
    │   ├── data_source
    │   │   ├── data_source.dart
    │   │   ├── weather_api.dart
    │   │   └── weather_api.g.dart
    │   ├── entity
    │   │   ├── weather.dart
    │   │   └── weather.g.dart
    │   ├── repository
    │   │   └── weather_repository.dart
    │   └── services
    │       ├── dio
    │       │   └── dio_client.dart
    │       ├── error_handler.dart
    │       └── interceptors
    │           └── connectivity_interceptor.dart
    ├── domain
    │   ├── entity
    │   │   └── weather.dart
    │   ├── repository
    │   │   └── weather_repository.dart
    │   └── usecase
    │       └── get_weather_usecase.dart
    ├── main.dart
    ├── presentation
    │   ├── weather_screen
    │   │   ├── bloc
    │   │   │   ├── weather_bloc.dart
    │   │   │   ├── weather_event.dart
    │   │   │   └── weather_state.dart
    │   │   └── weather_screen.dart
    │   └── welcome_screen.dart
    ├── resources
    │   └── generated
    │       └── assets.gen.dart
    └── utilities
        ├── constants.dart
        └── debouncer.dart  
```

****