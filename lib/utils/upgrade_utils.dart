import 'dart:math';

String getUpgradeTextFromRowUpgradeId(id) {
  switch (id) {
    case 0:
      return "Farmer";
    case 1:
      return "Swimmer";
    case 2:
      return "Fisherman";
    case 3:
      return "Miner";
    case 4:
      return "Lumberjack";
    case 5:
      return "Hunter";
    case 6:
      return "Explorer";
    default:
      throw UnimplementedError("No Upgrade implemented for Upgrade ID $id");
  }
}

int getUpgradeCosts(id, amount) {
  double baseCost;
  double scaleFactor;

  switch (id) {
    case 0:
      baseCost = 10;
      scaleFactor = 1.07;
      break;
    case 1:
      baseCost = 25;
      scaleFactor = 1.09;
      break;
    case 2:
      baseCost = 50;
      scaleFactor = 1.11;
      break;
    case 3:
      baseCost = 100;
      scaleFactor = 1.13;
      break;
    case 4:
      baseCost = 200;
      scaleFactor = 1.15;
      break;
    case 5:
      baseCost = 400;
      scaleFactor = 1.17;
      break;
    case 6:
      baseCost = 800;
      scaleFactor = 1.19;
      break;
    default:
      throw UnimplementedError(
          "No Upgrade cost calculation implemented for Upgrade ID $id");
  }

  return (baseCost * pow(scaleFactor, amount)).round();
}

String getImageSrcById(id) {
  switch (id) {
    case 0:
      return "assets/farmer.png";
    case 1:
      return "assets/swimmer.png";
    case 2:
      return "assets/fisherman.png";
    case 3:
      return "assets/miner.png";
    case 4:
      return "assets/lumberjack.png";
    case 5:
      return "assets/hunter.png";
    case 6:
      return "assets/explorer.png";
    default:
      throw UnimplementedError(
          "No Upgrade Image implemented for Upgrade ID $id");
  }
} 