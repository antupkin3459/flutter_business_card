import 'package:flutter/material.dart';

import 'contact_item.dart';

void main() {
  runApp(const MyBusinessCardApp());
}

class MyBusinessCardApp extends StatefulWidget {
  const MyBusinessCardApp({super.key});

  @override
  State<MyBusinessCardApp> createState() => _MyBusinessCardAppState();
}

class _MyBusinessCardAppState extends State<MyBusinessCardApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Візитівка Розробника',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: BusinessCardScreen(onThemeToggle: _toggleTheme),
    );
  }
}

class BusinessCardScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;

  const BusinessCardScreen({super.key, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Моя Візитівка'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onThemeToggle,
            tooltip: 'Змінити тему',
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/1?v=4',
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'Валерій Антипкін',
                style: Theme.of(context).textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Software Engineer',
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),

              const SizedBox(height: 24),
              const Divider(indent: 40, endIndent: 40),
              const SizedBox(height: 16),

              const ContactItem(icon: Icons.phone, text: '+380 (99) 111-11-11'),
              const ContactItem(
                icon: Icons.email,
                text: 'v.antupkin@istu.edu.ua',
              ),
              const ContactItem(
                icon: Icons.location_on,
                text: 'м. Ірпінь, Україна',
              ),
              const ContactItem(
                icon: Icons.link,
                text: 'github.com/antupkin3459', // Виправлений рядок
              ),

              const SizedBox(height: 24),

              FilledButton.icon(
                onPressed: onThemeToggle,
                icon: const Icon(Icons.palette),
                label: const Text('Змінити тему'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
