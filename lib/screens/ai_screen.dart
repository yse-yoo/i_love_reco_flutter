import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../api/ai_api.dart';

class AiScreen extends ConsumerWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("AI Recommendation")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: ctrl, decoration: const InputDecoration(labelText: "Your mood")),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text("Send (Test Mode)"),
            onPressed: () async {
              final api = AiApi();
              final res = await api.askAi(ctrl.text);

              showDialog(context: context, builder: (_) {
                return AlertDialog(
                  content: Text(res['reply']),
                );
              });
            },
          ),
        ]),
      ),
    );
  }
}