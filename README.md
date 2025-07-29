# 📱 Flutter App 2

A modern Flutter application demonstrating:
- 📇 Contact list with initials
- 📸 Image gallery with full-screen view
- 📊 Counter with increment/decrement
- 🌦 Weather forecast using OpenWeather API
- 🧭 Custom drawer navigation
- 🌍 Support for `.env` config (non-web only)

---

## 📌 Table of Contents

- [📱 Preview](#-preview)
- [✨ Features](#-features)
- [🖼 Screenshots](#-screenshots)
- [⚙️ Setup](#-setup)
- [📁 App Structure](#-app-structure)
- [📦 Dependencies](#-dependencies)
- [👨‍💻 Author](#-author)
- [📝 License](#-license)

---

## 🔥 Preview

> A complete Flutter app with multiple pages, drawer navigation, OpenWeather API integration, and clean theming.

---

## ✨ Features

- **Home Page** – simple UI entry point.
- **Contacts Page** – displays contacts with icons and design.
- **Gallery Page** – displays images using `Hero` transition to full screen.
- **Counter Page** – interactive counter using FAB.
- **Weather Page** – gets weather using OpenWeather API.
- Custom **Drawer Navigation** for screen switching.
- `.env` support to keep API keys secure (for mobile only).

---

## 🖼 Screenshots

![Home Screen](Screenshots/screen1.PNG)
![Gallery Screen](Screenshots/screen2.PNG)
![Weather Screen](Screenshots/screen3.PNG)

## ⚙️ Setup

### Clone this repo

```bash
git clone https://github.com/Elhajbi/flutter-app-2.git
cd flutter-app-2
```

### Install dependencies

```bash
flutter pub get
```

### Create `.env` file

Create a `.env` file in the root with the following:

```ini
OPENWEATHER_API_KEY=your_api_key_here
```

### Run the app

```bash
flutter run
```

---

## 📁 App Structure

```bash
lib/
├── main.dart
├── global/
│   └── global.parameters.dart
├── pages/
│   ├── home.page.dart
│   ├── counter.page.dart
│   ├── contacts.page.dart
│   ├── gallery.page.dart
│   └── meteo.page.dart
```

---

## 📦 Dependencies

- [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) – environment configuration
- [`http`](https://pub.dev/packages/http) – API calls
- [`weather_icons`](https://pub.dev/packages/weather_icons) – weather UI icons
- [`intl`](https://pub.dev/packages/intl) – date formatting
- `flutter/material.dart` – core Flutter UI kit

---

## 👨‍💻 Author

**Abdelkarim El Hajbi** – Full Stack Flutter Developer  
🔗 [LinkedIn](https://www.linkedin.com/in/abdelkarim-el-hajbi) | [GitHub](https://github.com/abdelkarimelhajbi)





