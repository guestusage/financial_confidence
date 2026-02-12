# Financial Confidence — by Rebecca Louise

A practical money management app for time-strapped mums seeking financial independence.

## Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase (Auth + Firestore)
- **Payments**: RevenueCat SDK (sandbox mode)

## Features

- 5-second Quick Add Expense (6 mum-friendly categories)
- Weekly Spending Dashboard with Circular Progress
- Confidence Score (gamified financial health)
- Rebecca's Daily Money Tips
- Savings Goals with Progress Tracking
- Dark Mode / Light Mode
- Glassmorphism UI Design

## Project Structure

```
lib/
├── main.dart              # App entry point
├── theme/
│   └── app_theme.dart     # Colors, typography, glassmorphism
├── models/
│   ├── category.dart      # 6 expense categories
│   ├── expense.dart       # Expense model + Firestore
│   └── savings_goal.dart  # Savings goal model
├── services/
│   ├── auth_service.dart  # Firebase Auth
│   └── firestore_service.dart  # Firestore CRUD
├── providers/
│   ├── auth_provider.dart     # Auth state
│   ├── expense_provider.dart  # Expense state + confidence score
│   └── savings_provider.dart  # Savings state
├── screens/
│   ├── onboarding_screen.dart
│   ├── auth_screen.dart
│   ├── home_screen.dart
│   ├── add_expense_screen.dart
│   ├── expense_list_screen.dart
│   ├── savings_screen.dart
│   ├── settings_screen.dart
│   └── main_shell.dart    # Bottom nav shell
└── widgets/
    ├── glass_card.dart        # Glassmorphism card
    ├── progress_ring.dart     # Animated progress ring
    ├── tip_card.dart          # Rebecca's tip card
    └── category_button.dart   # Category selector
```

## Getting Started (Project IDX)

1. Go to [idx.google.com](https://idx.google.com)
2. Create a new Flutter project
3. Copy the `lib/` folder and `pubspec.yaml` into the project
4. Run `flutter pub get`
5. Set up Firebase: `firebase login --no-localhost` → `flutterfire configure`
6. Run: `flutter run`

## License

Private project — Financial Confidence © 2026
