import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

void main() => runApp(const _MyApp());

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Center(
                child: InfoLabel(
                  text: "Error",
                  typeInfoLabel: TypeInfoLabel.error,
                  leftIcon: Icon(Icons.ac_unit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
