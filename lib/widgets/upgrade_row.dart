import 'package:flutter/material.dart';
import 'package:clicker_game/utils/upgrade_utils.dart';
import 'package:clicker_game/models/app_state.dart';
import 'package:provider/provider.dart';
import 'package:clicker_game/utils/number_utils.dart';

class UpgradeRow extends StatelessWidget {
  final int upgradeRowId;
  final double maxWidth;

  const UpgradeRow({
    super.key,
    required this.upgradeRowId,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    var amount = 0;
    var addUpgrade = appState.addFarmer;
    switch (upgradeRowId) {
      case 0:
        amount = appState.farmers;
        addUpgrade = appState.addFarmer;
        break;
      case 1:
        amount = appState.swimmers;
        addUpgrade = appState.addSwimmer;
        break;
      case 2:
        amount = appState.fishermen;
        addUpgrade = appState.addFisherman;
        break;
      case 3:
        amount = appState.miners;
        addUpgrade = appState.addMiner;
        break;
      case 4:
        amount = appState.lumberjacks;
        addUpgrade = appState.addLumberjack;
        break;
      case 5:
        amount = appState.hunters;
        addUpgrade = appState.addHunter;
        break;
      case 6:
        amount = appState.explorers;
        addUpgrade = appState.addExplorer;
        break;
      default:
        throw UnimplementedError(
            "Upgrade with ID $upgradeRowId is not correctly implemented.");
    }
    var entityTitle = getUpgradeTextFromRowUpgradeId(upgradeRowId);
    var upgradeCost = numerizeNumber(getUpgradeCosts(upgradeRowId, amount));
    var imgSrc = getImageSrcById(upgradeRowId);

    return Column(
      children: [
        Text("$amount x $entityTitle Upgradecost: $upgradeCost"),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: theme.dividerColor),
                    bottom: BorderSide(color: theme.dividerColor),
                    left: BorderSide(color: theme.dividerColor),
                    right: BorderSide(color: theme.dividerColor),
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      for (var i = 0;
                          i < amount &&
                              i < maxWidth / 70 - (maxWidth > 600 ? 6 : 3);
                          i++)
                        Image(
                          image: AssetImage(imgSrc),
                          height: 70,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => {addUpgrade(context)},
              child: const Text("+"),
            ),
          ],
        ),
      ],
    );
  }
}
