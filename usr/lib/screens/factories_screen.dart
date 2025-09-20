import 'package:flutter/material.dart';

class FactoriesScreen extends StatelessWidget {
  const FactoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Factories Management',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Placeholder to add a new factory
        },
        tooltip: 'Add Factory',
        child: const Icon(Icons.add),
      ),
    );
  }
}
