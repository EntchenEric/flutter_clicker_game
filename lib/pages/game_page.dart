import 'package:flutter/material.dart';
import 'package:clicker_game/widgets/clickable.dart';
import 'package:clicker_game/widgets/upgrade_row.dart';
import 'package:clicker_game/widgets/money_card.dart';

class GamePage extends StatelessWidget {
  final double maxWidth;
  const GamePage({
    super.key,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Clickable(),
                UpgradeRow(upgradeRowId: 0, maxWidth: maxWidth),
                UpgradeRow(upgradeRowId: 1, maxWidth: maxWidth),
                UpgradeRow(upgradeRowId: 2, maxWidth: maxWidth),
                UpgradeRow(upgradeRowId: 3, maxWidth: maxWidth),
                UpgradeRow(upgradeRowId: 4, maxWidth: maxWidth),
                UpgradeRow(upgradeRowId: 5, maxWidth: maxWidth),
                UpgradeRow(upgradeRowId: 6, maxWidth: maxWidth),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: MoneyCard(),
        )
      ],
    );
  }
}
