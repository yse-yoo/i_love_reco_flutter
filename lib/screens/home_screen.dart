import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/auth_provider.dart';
import 'ai_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(authProvider).me(),
      builder: (context, snap) {
        if (!snap.hasData) return const CircularProgressIndicator();

        final user = snap.data!;
        return Scaffold(
          appBar: AppBar(title: Text("Hello ${user['username']}")),
          body: Center(
            child: ElevatedButton(
              child: const Text("Ask AI"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AiScreen()));
              },
            ),
          ),
        );
      },
    );
  }
}