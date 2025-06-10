import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_colors.dart';
import 'bloc/theme_cubit.dart';
import 'bloc/theme_state.dart';

class ThemeShowcase extends StatelessWidget {
  const ThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Showcase'),
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return PopupMenuButton<AppThemeMode>(
                icon: Icon(_getThemeIcon(state.themeMode)),
                onSelected: (themeMode) {
                  context.read<ThemeCubit>().changeTheme(themeMode);
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: AppThemeMode.light,
                    child: Row(
                      children: [
                        Icon(Icons.light_mode),
                        SizedBox(width: 8),
                        Text('Light'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: AppThemeMode.dark,
                    child: Row(
                      children: [
                        Icon(Icons.dark_mode),
                        SizedBox(width: 8),
                        Text('Dark'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: AppThemeMode.system,
                    child: Row(
                      children: [
                        Icon(Icons.auto_mode),
                        SizedBox(width: 8),
                        Text('System'),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Colors Section
            _buildSection(context, 'Colors', [
              _buildColorCard('Primary', AppColors.primary),
              _buildColorCard('Success', AppColors.success),
              _buildColorCard('Warning', AppColors.warning),
              _buildColorCard('Error', AppColors.error),
              _buildColorCard('Info', AppColors.info),
            ]),

            const SizedBox(height: 24),

            // Buttons Section
            _buildSection(context, 'Buttons', [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated Button'),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined Button'),
              ),
              const SizedBox(height: 8),
              TextButton(onPressed: () {}, child: const Text('Text Button')),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: null,
                child: const Text('Disabled Button'),
              ),
            ]),

            const SizedBox(height: 24),

            // Input Fields Section
            _buildSection(context, 'Input Fields', [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Error Field',
                  hintText: 'This field has an error',
                  prefixIcon: Icon(Icons.error),
                  errorText: 'This field is required',
                ),
              ),
            ]),

            const SizedBox(height: 24),

            // Cards Section
            _buildSection(context, 'Cards', [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sample Card',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This is a sample card following Apple design guidelines with proper spacing and typography.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Action'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),

            const SizedBox(height: 24),

            // List Tiles Section
            _buildSection(context, 'List Items', [
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                subtitle: Text('Manage your profile settings'),
                trailing: Icon(Icons.chevron_right),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                subtitle: Text('Configure notification preferences'),
                trailing: Icon(Icons.chevron_right),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.security),
                title: Text('Security'),
                subtitle: Text('Privacy and security settings'),
                trailing: Icon(Icons.chevron_right),
              ),
            ]),

            const SizedBox(height: 24),

            // Typography Section
            _buildSection(context, 'Typography', [
              Text(
                'Headline Large',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Headline Medium',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Title Large',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Body Large - This is the default body text that follows Apple typography guidelines for readability and accessibility.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Body Medium - Secondary body text with proper hierarchy and spacing.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Caption - Small text for labels and captions',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ]),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildColorCard(String name, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  color.value.toRadixString(16).toUpperCase(),
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getThemeIcon(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return Icons.light_mode;
      case AppThemeMode.dark:
        return Icons.dark_mode;
      case AppThemeMode.system:
        return Icons.auto_mode;
    }
  }
}
