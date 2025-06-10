import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'app.dart';

void main() {
  AppConfig.setEnvironment(Environment.test);
  runApp(const AidraConnectApp());
}
