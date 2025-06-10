import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/app_config.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // Default to development environment
  AppConfig.setEnvironment(Environment.dev);

  runApp(AidraConnectApp(sharedPreferences: sharedPreferences));
}
