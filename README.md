# 🎓 My Graduation Project: Drive Wise

**Drive Wise** is an intelligent driving assistant application built with Flutter. It is designed to enhance road safety by providing real-time monitoring of driving metrics and offering a dynamic rating system to encourage safer driving habits.

## 🎥 My Graduation Project

> **Note**: GitHub READMEs cannot directly play videos hosted on Google Drive. Please click the banner below to watch the demo.

<h3 align="center">
  <a href="https://drive.google.com/file/d/1M56bnzUFGKf_lF40eNcxM8HQ3rB6KO5W/view?usp=sharing">▶️ Click Here to Watch My Graduation Project Video</a>
</h3>

## ✨ Key Features

- **🚀 Real-Time Speed Monitoring**: Tracks vehicle speed instantly using Firebase Realtime Database integration.
- **⭐ Driver Rating System**: A smart algorithm that evaluates driving behavior and awards a star rating based on speed maintenance and safety compliance.
- **🔐 Secure Authentication**: 
  - Complete sign-up and login workflow.
  - Email verification to ensure genuine users.
  - Secure password recovery (Forgot Password) system.
- **⚙️ User Management**:
  - Personalized settings.
  - Secure "Change Password" functionality.
- **📊 Real-Time Dashboard**: Visual feedback on driving performance with instant updates.

## 🛠️ Tech Stack

This project leverages a robust modern tech stack:

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Backend**: [Firebase](https://firebase.google.com/)
  - **Firebase Auth**: For secure user authentication.
  - **Firebase Realtime Database**: For low-latency speed and violation tracking.
- **State Management**: 
  - `Provider` for efficient state handling.
  - `GetX` for reactive state and route management.
- **Utilities**:
  - `bot_toast`: For non-intrusive user notifications.
  - `shared_preferences`: For local data persistence.

## 📂 Project Structure

```bash
lib/
├── modules/           # Feature-specific modules
│   ├── Home_layout/   # Dashboard and Real-Time monitoring
│   ├── login/         # Authentication screens
│   ├── sign_up/       # Registration logic
│   ├── Verify/        # Email verification
│   └── ...            # Other features (Settings, Splash, etc.)
├── shared/            # Reusable widgets and providers
├── styles/            # App theming and design tokens
├── main.dart          # Application entry point
└── firebase_options.dart # Firebase configuration
```

## 🚀 Getting Started

Follow these steps to set up the project locally.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version >=3.1.0 <4.0.0)
- Dart SDK
- Just verify your environment with `flutter doctor`

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/drive-wise.git
   cd Drive-Wise
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Ensure you have the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) placed in their respective directories:
     - `android/app/google-services.json`
     - `ios/Runner/GoogleService-Info.plist`

4. **Run the App**
   ```bash
   flutter run
   ```

## 🤝 Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


---
*Built with ❤️ by the Drive Wise Team*
