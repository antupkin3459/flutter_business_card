import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    // Отримуємо поточну тему, щоб не використовувати жорстко задані кольори (Вимога завдання)
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // Використовуємо колір з теми для фону картки
      color: theme.colorScheme.surfaceContainerHighest,
      elevation: 0,
      child: ListTile(
        leading: Icon(
          icon,
          // Колір іконки береться з основної палітри теми
          color: theme.colorScheme.primary,
        ),
        title: Text(
          text,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
