import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/auth_provider.dart';
import 'home_screen.dart';

class LoginScreen extends ConsumerWidget {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: "Email")),
          TextField(controller: passCtrl, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text("Login"),
            onPressed: () async {
              final ok = await ref.read(authProvider).login(emailCtrl.text, passCtrl.text);

              if (ok) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
              }
            },
          )
        ]),
      ),
    );
  }
}
