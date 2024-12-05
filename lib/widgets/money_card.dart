import 'package:flutter/material.dart';
import 'package:clicker_game/models/app_state.dart';
import 'package:provider/provider.dart';
import 'package:clicker_game/utils/number_utils.dart';

class MoneyCard extends StatelessWidget {
  const MoneyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    var money = numerizeNumber(appState.money.round());

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          textAlign: TextAlign.center,
          "$money\$", // Removed unnecessary braces
          style: theme.textTheme.headlineMedium, // Optional: Add styling
        ),
      ),
    );
  }
}