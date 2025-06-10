# Environment Configuration Setup

This Flutter project supports multiple environments with different API base URLs:

## Environments

### Development Environment
- **Base URL:** `https://dev-api.aidra.tech`
- **Debug Mode:** Enabled
- **App Name:** "Aidra Connect - Dev"

### Test/Production Environment
- **Base URL:** `https://test-api.aidra.tech`
- **Debug Mode:** Disabled
- **App Name:** "Aidra Connect - Test"

## Running the App

### Option 1: Using Shell Scripts (Recommended)
```bash
# Run development environment
./scripts/run_dev.sh

# Run test environment
./scripts/run_test.sh
```

### Option 2: Using Flutter CLI
```bash
# Run development environment
flutter run -t lib/main_dev.dart

# Run test environment
flutter run -t lib/main_test.dart

# Run default (development) environment
flutter run
```

### Option 3: Using VS Code
1. Open the project in VS Code
2. Go to Run and Debug (Ctrl/Cmd + Shift + D)
3. Select either "Development" or "Test/Production" configuration
4. Press F5 or click the play button

## File Structure

```
lib/
├── config/
│   └── app_config.dart          # Environment configuration manager
├── services/
│   └── api_service.dart         # API service using environment config
├── app.dart                     # Main app widget
├── main.dart                    # Default entry point (dev environment)
├── main_dev.dart               # Development environment entry point
└── main_test.dart              # Test environment entry point

scripts/
├── run_dev.sh                  # Development runner script
└── run_test.sh                 # Test runner script

.vscode/
└── launch.json                 # VS Code launch configurations
```

## Using the Configuration

### In Your Code
```dart
import 'package:aidraconnect/config/app_config.dart';

// Get current environment
Environment env = AppConfig.environment;

// Get base URL
String baseUrl = AppConfig.currentBaseUrl;

// Get app name
String appName = AppConfig.currentAppName;

// Check if in debug mode
bool isDebug = AppConfig.isDebugMode;
```

### In API Services
```dart
import 'package:aidraconnect/services/api_service.dart';

// Use the API service (automatically uses correct environment)
ApiService api = ApiService.instance;
await api.authenticate('username', 'password');
```

## Adding New Environments

1. Add new environment to the enum in `lib/config/app_config.dart`:
```dart
enum Environment { dev, test, staging, prod }
```

2. Add the configuration in the `setEnvironment` method:
```dart
case Environment.staging:
  _instance = AppConfig._(
    baseUrl: 'https://staging-api.aidra.tech',
    appName: 'Aidra Connect - Staging',
    debugMode: true,
  );
  break;
```

3. Create a new main entry point (e.g., `lib/main_staging.dart`)
4. Add launch configuration in `.vscode/launch.json`
5. Create a runner script in `scripts/`

## Notes

- The default `main.dart` uses the development environment
- Environment is set at app startup and cannot be changed at runtime
- All API calls should go through the `ApiService` to automatically use the correct base URL
- The app displays the current environment configuration on the home screen for easy verification 