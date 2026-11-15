import 'package:flutter/material.dart';

void main() => runApp(const SecuraApp());

class SecuraApp extends StatelessWidget {
  const SecuraApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SECURA',
    theme: ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF40D9AE),
        brightness: Brightness.dark,
      ),
    ),
    home: const SecuraHome(),
  );
}

class SecuraHome extends StatelessWidget {
  const SecuraHome({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('SECURA'), actions: const [
      Padding(padding: EdgeInsets.all(12), child: Icon(Icons.shield_outlined)),
    ]),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lock_outline, size: 56, color: Color(0xFF40D9AE)),
          const SizedBox(height: 24),
          const Text('Private by design', style: TextStyle(fontSize: 26)),
          const SizedBox(height: 12),
          const Text('SECURA Android test build. Messaging and encryption are not connected in this build.'),
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Test build'),
                content: const Text('The messaging backend is not connected yet.'),
                actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
              ),
            ),
            icon: const Icon(Icons.message_outlined),
            label: const Text('Open test screen'),
          ),
        ],
      ),
    ),
  );
}
