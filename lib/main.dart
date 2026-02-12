import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/expense_provider.dart';
import 'providers/savings_provider.dart';
import 'screens/onboarding_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/main_shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FinancialConfidenceApp());
}

class FinancialConfidenceApp extends StatefulWidget {
  const FinancialConfidenceApp({super.key});

  @override
  State<FinancialConfidenceApp> createState() => _FinancialConfidenceAppState();
}

class _FinancialConfidenceAppState extends State<FinancialConfidenceApp> {
  bool _isDarkMode = false;
  bool _hasSeenOnboarding = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
        ChangeNotifierProvider(create: (_) => SavingsProvider()),
      ],
      child: MaterialApp(
        title: 'Financial Confidence',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: _buildHome(),
      ),
    );
  }

  Widget _buildHome() {
    // Show onboarding first time
    if (!_hasSeenOnboarding) {
      return OnboardingScreen(
        onComplete: () {
          setState(() => _hasSeenOnboarding = true);
        },
      );
    }

    // Auth gate
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        if (auth.isLoggedIn) {
          // Initialize data listeners
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<ExpenseProvider>().listenToExpenses();
            context.read<ExpenseProvider>().listenToWeeklyExpenses();
            context.read<SavingsProvider>().listenToGoals();
          });

          return Container(
            decoration: BoxDecoration(
              gradient: _isDarkMode
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.darkBg,
                        Color(0xFF162332),
                        AppColors.darkBg,
                      ],
                    )
                  : const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.lightBg,
                        Color(0xFFE8F5E9),
                        AppColors.lightBg,
                      ],
                    ),
            ),
            child: MainShell(
              isDarkMode: _isDarkMode,
              onThemeChanged: (val) => setState(() => _isDarkMode = val),
            ),
          );
        }

        return const AuthScreen();
      },
    );
  }
}
